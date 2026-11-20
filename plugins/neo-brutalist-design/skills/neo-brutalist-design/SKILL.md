---
name: neo-brutalist-design
description: Apply a bold, modern neo-brutalist design language to any medium: websites, slides, posters, social graphics, UI, brand assets. Use for catchy, high-impact, still-professional visuals.
---

# Neo-brutalist design: a medium-agnostic playbook

A design language for work that must be noticed immediately yet stay clean, readable and professional. It is a set of principles and tokens, not a template. Apply it to a landing page, a slide, a poster, a social card, an app screen, a dashboard or a brand kit.

## 1. Core principles
1. Hard edges, no softness: thick solid borders, hard offset shadows with zero blur, flat fills, no gradients, no glassmorphism.
2. Clash with discipline: bold saturated accents on a calm white or off-white base. One dominant accent per composition, others in support.
3. Hierarchy by size and placement: one oversized headline, then a clear second level, then small supporting detail. The eye should land on the key point first, in under a second.
4. Playful shapes, serious content: circles, zigzags, waves, sparkles, triangles as decoration, but the copy stays honest, specific and useful.
5. Legibility first: large type, strong contrast (navy or black on light fills), nothing decorative behind body text.
6. Restraint: decorations live in free space (corners, margins, empty bands). If it competes with the message, remove it.
7. Never shorten or rewrite the author's own wording to make a layout fit; adapt the layout instead.

## 2. Design tokens (defaults, override with brand colours when given)
- Base: #ffffff (optionally a faint dot grid #d5daf2, dot r~2.3, spacing ~34 units in a 1433x806 canvas).
- Ink: navy #0b1650 for text, pure black #000 for borders and shadows.
- Accents: yellow #ffe600, blue #3b6cff, pink #ff6fb5, red #e11d2e (for one emphasised word), green #6ee06a.
- Pastel card fills: green #b6d7a8, orange #f9cb9c, purple #b4a7d6, red #ea9999.
- Borders: 3-4px black (scale with the medium). Radius: moderate (8-16px) or fully round for badges.
- Shadow: solid black, offset right and down (about 45 degrees), distance about 2.5-3x the border width, 0 blur, 100% opacity.
- Badges: yellow circle, black border, bold numerals (01, 02, 03...).
- Type: a heavy condensed display face for the headline (Impact, Anton, Bebas Neue, Archivo Black), a clean sans for body (Arial, Inter, DM Sans). Optionally give each card title its own personality font (serif display, script, quirky mono) to add variety; verify each font actually applied.

## 3. Signature components
- Stacked cards: coloured fill, thick border, hard shadow, numbered badge on the left, title + one-line detail, optional icon sticker top-right.
- Icon stickers: white circle, black outline, hard shadow, navy line icon inside, placed on a card corner. Use an open-licence set such as Tabler Icons (MIT): https://github.com/tabler/tabler-icons (raw SVGs under icons/outline/<name>.svg). Choose metaphors that match the meaning (rocket = start, target = finish, flame = burnout).
- Marker highlight: a flat yellow rounded rectangle, no border, behind the key phrase of the headline, slightly rotated (about -1 degree).
- Decorative set for empty space: wavy line, 4-point star, partial blue circle bleeding off a corner, zigzag, dot and triangle with outlines and hard shadows.
- Optional pictograms or data blocks: chunky yellow/green blocks with black stroke and offset shadow, dashed outline for empty or missing units.

## 4. Layout recipe
- Two zones: left = headline + short description, right = stack of 3-5 cards. Or a single column on narrow formats.
- Headline: 2 lines max, one accent word in red, the key phrase on a yellow marker.
- Keep generous gaps (about 12-15px between cards at slide scale). Align edges; let only the decorations break the grid.
- Footer and page numbers stay small and quiet.
- Check contrast and size for the worst viewing case (a projector, a phone). Bigger is almost always right.

## 5. Process
1. Understand the message and audience; find the 3-5 key points and the one phrase to highlight.
2. Reserve safe zones for text first, then place decorations in what is left.
3. Pick icons by meaning, not decoration.
4. Build, look at the result, and iterate on: background feel, colour harmony, font sizes, spacing. Expect several rounds; ask what looks "mid" and push contrast, scale and placement.
5. Do a final check: nothing overlaps text, fonts applied correctly, colours consistent, original copy intact.

## 6. Implementing in different media

### Websites / UI (HTML + CSS)
```css
:root{--ink:#0b1650;--line:#000;--yellow:#ffe600;--blue:#3b6cff;--pink:#ff6fb5;--card-green:#b6d7a8;--card-orange:#f9cb9c;--card-purple:#b4a7d6;--card-red:#ea9999}
body{background:#fff;background-image:radial-gradient(#d5daf2 2.3px,transparent 2.3px);background-size:34px 34px;color:var(--ink)}
.card{background:var(--card-green);border:4px solid var(--line);border-radius:14px;box-shadow:10px 10px 0 var(--line);padding:20px 24px}
.card:hover{transform:translate(4px,4px);box-shadow:6px 6px 0 var(--line)}
.badge{width:56px;height:56px;border-radius:50%;background:var(--yellow);border:4px solid var(--line);display:grid;place-items:center;font:800 20px/1 Arial}
.mark{background:linear-gradient(transparent 35%,var(--yellow) 35%);padding:0 .15em}
.btn{background:var(--yellow);border:4px solid var(--line);box-shadow:6px 6px 0 var(--line);font-weight:800}
.btn:active{transform:translate(6px,6px);box-shadow:0 0 0 var(--line)}
```
Add hover/press states that move the element into its shadow. Keep focus outlines visible. Use semantic HTML and keep contrast at WCAG AA or better.

### Slides and documents
Use the same tokens with a single free-form slide: headline top-left, description, stacked cards on the right. In Google Slides: card fill from the light-2 palette, 4px black border, drop shadow (black, 100% opacity, 45 degrees, 10px, 0 blur), per-card title fonts. Background and sticker art are raster images. Build them as SVG, render in a browser tab, screenshot, and upload. See the companion skill neo-brutalist-slide-design for the exact Chrome automation steps and gotchas.

### Posters, social graphics, brand assets
Compose in SVG (viewBox set to the target aspect). Use the decorative set in free corners, one headline, 2-4 supporting blocks. Export PNG or PDF. For a brand kit, record the tokens above plus the chosen fonts and icon set as the system.

### Rendering SVG decorations (shared snippet)
```js
// star, wave and zigzag helpers
const star=(cx,cy,r)=>`<path d="M${cx} ${cy-r} Q${cx+r*.18} ${cy-r*.18} ${cx+r} ${cy} Q${cx+r*.18} ${cy+r*.18} ${cx} ${cy+r} Q${cx-r*.18} ${cy+r*.18} ${cx-r} ${cy} Q${cx-r*.18} ${cy-r*.18} ${cx} ${cy-r}Z"/>`;
let zig='M70 700';for(let i=0;i<9;i++)zig+=' l22 -34 l22 34';
let wave='M700 52';for(let i=0;i<7;i++)wave+=' q14 -26 28 0 t28 0';
```
Draw every solid shape twice: a black copy offset by the shadow distance underneath, then the coloured, outlined shape on top.

## 7. Do and don't
Do: big type, thick borders, hard shadows, flat colour, meaningful icons, white space, one accent word.
Don't: gradients, soft shadows, tiny text, stock-photo clutter, emojis as the main graphic, more than 3-4 accent colours at full strength, decorations over copy, rewriting the author's words, claims the author has not made.

## 8. Sources of inspiration
Neubrutalism examples and write-ups (e.g. https://chrislemke.github.io/website_designs/examples/Neubrutalism.html), plus Tabler Icons for line icons. Treat them as inspiration; do not copy specific brands, artworks or characters.
