# Design direction — ~/learning hub

Shared with every course (e.g. `aem-eds-training`). The hub is the library; the courses
are the books. Same visual language throughout.

**Mood:** editorial study-library. A quiet index of courses, not a terminal dashboard.
Personality is "learning / dev" — but expressed through restraint and one accent, not CRT
chrome. Mono is used ONLY for paths, commands, and code — never for the whole UI.

**Mode:** Read. Must stay fully legible on e-ink (Kindle Paperwhite) and with JS disabled.

## Type
- **Display / headings:** Fraunces (serif with character). Tight tracking, `text-wrap: balance`.
- **Body / UI:** Source Sans 3 (humanist sans). Base ≥16px, generous line-height (~1.6).
- **Mono:** JetBrains Mono / SF Mono, only for the `~/learning` mark, repo paths, commands.

## Color (identical tokens to the course lessons)
- Base off-white `#fbfaf7` — never `#000` or pure `#fff`.
- Text near-black `#141414`; warm grays (`--muted`, `--faint`) for meta only.
- ONE accent: oxide red `#9c3818` — links, one title detail, progress fill.
- No dark background, no terminal green/cyan, no gradients, no glow.

## Kindle / e-ink hard rules
- High contrast: dark text on light. No mid-gray on tinted fills.
- Course list is **static HTML** — present and readable with JS off or failing.
  Progress numbers are baked into the markup; JS only refreshes them (progressive enhancement).
- Big type, generous leading. No complex grid or dense sticky headers.
- Links look like links without hover: visible text + underline, clear tap area.
- No decorative emoji (they render as tofu boxes on e-ink).

## Layout
- Masthead: `~/learning` mark + one-line purpose. No shell prompt, no booting, no blinking cursor.
- **Course library:** a ruled vertical list — number, name, one-line description, progress, link.
  Not a grid of dashboard cards.
- Secondary meta (repos, commits, streak) comes AFTER the list, small and quiet.
- Feed (HN / Dev.to / reddit), if kept, is optional and at the very bottom — never blocking.
