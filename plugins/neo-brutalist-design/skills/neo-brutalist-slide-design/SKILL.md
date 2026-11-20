---
name: neo-brutalist-slide-design
description: Design a bold, modern neo-brutalist slide (cards, icon stickers, marker highlight, dot-grid background) and build it in Google Slides via Chrome. Use for catchy talk or conference slides.
---

# Neo-brutalist slide design (Google Slides via Claude in Chrome)

A repeatable recipe for a single free-form, high-impact slide that stays professional and is readable when projected. For the general design language (tokens, components, principles) see the companion skill `neo-brutalist-design`; this skill is the Google Slides build pipeline.

## Design language (summary)
- White base with a faint dot grid (#d5daf2, r~2.3, spacing ~34 in a 1433x806 space). Tinted backgrounds tend to look worse; keep white.
- Thick black borders (4px) and HARD offset shadows (black, 100% opacity, 45 deg, ~10px distance, 0 blur). No gradients, no soft shadows.
- Flat palette: Slides light-2 pastels for cards (green #b6d7a8, orange #f9cb9c, purple #b4a7d6, red #ea9999), yellow #ffe600 for badges/highlight, navy #0b1650 text, red #e11d2e accent word, blue #3b6cff and pink #ff6fb5 shapes.
- Layout: oversized title top-left (Impact ~72pt, navy, accent word in red), the author's original description under it at 22-28pt bold navy, a right column of 4 stacked cards (each ~490x95px on screen) with a yellow numbered badge (01-04, 20pt, black 4px border).
- Fonts: a DIFFERENT font per card title (e.g. Impact, Fraunces, a Lobster-style script, a quirky mono) at 26-34pt; detail line 18pt+ Arial. Verify the font after picking: the picker's list order shifts with Recent fonts.
- Never shorten the author's original text. Footer/page number come from the layout; leave them.

## Decorations (as images)
1. Icon stickers: Tabler Icons (MIT), raw SVGs at raw.githubusercontent.com/tabler/tabler-icons/main/icons/outline/<name>.svg (rocket, target-arrow, mood-nervous, flame, flag-3, brain, bolt, code, battery...). Render each as a white circle with black stroke + hard shadow, navy icon, on a flat background equal to the card fill so it blends in. Place in the top-right of the card title row, ~2.1cm x 1.74cm.
2. Background image: dot grid + yellow marker rectangle (no border) behind the key title line + wavy line, 4-point pink star, blue circle peeking from a corner + red zigzag, green dot, blue triangle in the free bottom-left band. Keep decorations out of text areas.

## Build pipeline (no local file upload needed)
file_upload cannot read /tmp, so render the graphic in a side Chrome tab and drop a screenshot into Slides:
1. tabs_create_mcp, navigate to https://example.com, then javascript_tool: set document.body.innerHTML to an <svg> with style position:fixed; left:0; top:0; width:100vw; height:100vh.
2. Aspect trick: the screenshot is the whole viewport (e.g. 1456x830). Draw the SVG with a small viewBox of the TARGET aspect and preserveAspectRatio="none" (stickers: viewBox 0 0 58 48; background: viewBox 0 0 1433 806 for 16:9). The image then fills the screenshot, and resizing it in Slides to the exact target size removes the distortion.
3. Hover the mouse at the far corner (1455,829) before the screenshot so no cursor speck gets baked in. Take a full screenshot (get its ID), then upload_image to the Slides tab.
4. Drop over an existing shape -> inserted as an image object. Drop over an EMPTY slide area -> becomes the slide BACKGROUND (this is how the dot-grid background is applied; clear it by re-picking a solid colour in Background).
5. Screenshot IDs expire in a few minutes; re-screenshot if an upload fails.
6. Close the side tab at the end.

## Precise sizing/positioning of a dropped image
Select it, click Format options, expand Size & rotation (uncheck Lock aspect ratio) and Position. Units follow the document locale (cm, comma decimal: type 2,1). Set Width, Tab, Height, Tab; scroll the panel 3 ticks to reach X/Y: triple_click the field, type, Tab, type Y, Tab. The panel KEEPS its scroll position between images: take a screenshot after each drop to see which fields are on screen before typing, otherwise clicks hit the wrong controls (it once rotated an image and toggled Reflection; fix by selecting the image and pressing Delete, then redo). Use browser_batch, but all actions in a batch must use the same tabId.
- On a 33.87cm wide slide with the panel open, ~24.85 screen px = 1 cm; panel closed ~28.4 px per cm.

## Gotchas
- cmd+a outside text-edit mode selects ALL objects; pressing Return in a text box inserts a newline.
- To delete a shape safely: select it, Escape, then Delete (a first Delete can enter text edit).
- Text edits: cmd+] indents; cmd+shift+l left-aligns; Format > Line & paragraph spacing > Single.
- The deck may be collaboratively edited; slide numbers shift and others' cursors appear. Re-screenshot before acting.
- Finish with a zoom screenshot of the slide region and send it to the user; verify nothing overlaps text.
- Do not put claims in descriptive text that the speaker hasn't made (e.g. medical or diagnosis claims).
