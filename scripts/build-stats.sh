#!/usr/bin/env bash
# Genera stats.json leyendo la API de GitHub autenticada (5000 req/h con GH_TOKEN).
# Un objeto por repo: { pushed_at, commits (30d), done (lecciones NNNN-*.html) }.
set -euo pipefail

USER="rafaelmaldonado"
REPOS=(react-training aem-eds-training aem-cloud-migration japones claude-certified-architect learn-java-21-aem learn-aem-forms-backend learn-amazon-fba learn-aem-assets-professional)
SINCE=$(date -u -d '30 days ago' +%Y-%m-%dT%H:%M:%SZ)

gh_json(){ gh api "$1" 2>/dev/null || echo 'null'; }

echo "{" > stats.json
echo "  \"generated\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\"," >> stats.json
echo "  \"repos\": {" >> stats.json

first=1
for r in "${REPOS[@]}"; do
  pushed=$(gh_json "repos/$USER/$r" | jq -r '.pushed_at // ""')
  commits=$(gh_json "repos/$USER/$r/commits?since=$SINCE&per_page=100" | jq 'if type=="array" then length else 0 end')
  # lecciones NNNN-*.html en lessons/
  done=$(gh_json "repos/$USER/$r/contents/lessons" \
    | jq '[ if type=="array" then .[] else empty end | select(.name|test("^[0-9]+.*\\.html$")) ] | length')
  [ "$first" = 1 ] && first=0 || echo "," >> stats.json
  printf '    "%s": {"pushed_at":"%s","commits":%s,"done":%s}' "$r" "$pushed" "${commits:-0}" "${done:-0}" >> stats.json
done

echo "" >> stats.json
echo "  }" >> stats.json
echo "}" >> stats.json

cat stats.json
