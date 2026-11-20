<p align="center"><img src="assets/logo-banner.png" alt="neo-brutalist design kit" width="720"></p>

# Neo-Brutalist Design Kit

Skills that teach Claude a bold, modern neo-brutalist design language: thick black borders, hard offset shadows, flat clashing colour, oversized type, icon stickers and playful shapes, while staying readable and professional.

## Gallery

What the style looks like in practice. Every example was made by Claude with these skills.

### Conference talk slide (Google Slides)
![Conference talk slide](docs/slide.png)

### Landing page
Source: [`examples/landing-page.html`](examples/landing-page.html), one self-contained file, open it in any browser.

![Landing page](docs/landing-page.png)

### Event poster
Source: [`examples/poster.html`](examples/poster.html)

<img src="docs/poster.png" width="480" alt="Event poster">

### Social / blog card
Source: [`examples/social-card.html`](examples/social-card.html)

![Social card](docs/social-card.png)

All examples use the same tokens: white dot-grid base, 4px black borders, hard offset shadows, flat pastel cards, yellow badges and marker, one red accent word.

## What's inside

| Skill | Use it for |
| --- | --- |
| `neo-brutalist-design` | A medium-agnostic playbook: principles, colour/type tokens, components, layout recipe, CSS and SVG snippets for websites, posters, social graphics and brand assets. |
| `neo-brutalist-slide-design` | Building a single high-impact slide in Google Slides through Claude in Chrome: rendering SVG art, dropping it in as images or backgrounds, and sizing it precisely. |

## Install

In Claude Code:

```
/plugin marketplace add NasirMustafayev/neo-brutalist-design-kit
/plugin install neo-brutalist-design@neo-brutalist-design-kit
```

Then ask for it by name, for example: "Design a landing page hero in the neo-brutalist style" or "Make my talk slide neo-brutalist".

You can also copy the two `SKILL.md` files under `plugins/neo-brutalist-design/skills/` into your own `~/.claude/skills/<name>/` folders.

## Use it with other AI tools and agents

The skills use the open `SKILL.md` format (a Markdown file with a short YAML header), and the design rules themselves are plain Markdown, so they travel well. Ready-made copies live in [`adapters/`](adapters/):

| Tool | What to copy | Where it goes |
| --- | --- | --- |
| Claude Code / Claude apps | install the plugin (above) | automatic |
| Codex, Cursor, Copilot coding agent and other tools that read `AGENTS.md` | `adapters/AGENTS.md` | `AGENTS.md` in your project root |
| Gemini CLI | `adapters/GEMINI.md` | `GEMINI.md` in your project root |
| Cursor rules | `adapters/cursor/neo-brutalist-design.mdc` | `.cursor/rules/` |
| GitHub Copilot custom instructions | `adapters/copilot/copilot-instructions.md` | `.github/copilot-instructions.md` |
| Any chat AI (ChatGPT, Gemini, etc.) | open `adapters/AGENTS.md` and paste it | at the start of your chat, then ask for the design |

Each tool's file locations can change, so check its docs if a file isn't picked up.

What works everywhere: the principles, tokens, components, layout recipe and the CSS/SVG snippets, plus the HTML examples in `examples/`. What is Claude-specific: the Google Slides pipeline in `neo-brutalist-slide-design` relies on Claude in Chrome browser tools, so other agents need an equivalent browser-control tool to follow it.

Maintainers: edit only the `neo-brutalist-design` SKILL.md, then run `scripts/sync-adapters.sh` to refresh the adapter files.

## Maintaining

Bump `version` in `plugins/neo-brutalist-design/.claude-plugin/plugin.json` on every release, otherwise users stay on their cached copy. Validate before pushing: `claude plugin validate .`

## Credits

Icons are by [Tabler Icons](https://github.com/tabler/tabler-icons) (MIT). Style inspiration: public neubrutalism write-ups and examples.

## License

MIT, see `LICENSE`.
