# Repository Guidelines

## Project Structure & Module Organization

This repository is a static TOEIC Listening & Reading practice app for GitHub Pages.

- `index.html` contains the full app: markup, styles, JavaScript state, question generation, quiz flow, and responsive UI.
- `assets/part1/` stores Part 1 image assets used by photograph questions. Keep filenames stable, e.g. `conference-room.png`.
- `tools/create-part1-assets.ps1` regenerates the bundled Part 1 PNG scenes.
- `.nojekyll` ensures GitHub Pages serves static files directly.
- `README.md` is user-facing documentation.

There is no package manager, backend, or separate module build step.

## Build, Test, and Development Commands

Run locally from the repository root:

```powershell
py -m http.server 8000 --bind 127.0.0.1
```

Then open `http://127.0.0.1:8000/index.html`.

Regenerate Part 1 images:

```powershell
powershell -ExecutionPolicy Bypass -File tools/create-part1-assets.ps1
```

Deploy is automatic after pushing to `main`; GitHub Pages serves from repository root.

## Coding Style & Naming Conventions

Use plain HTML, CSS, and vanilla JavaScript in `index.html`. Keep indentation at two spaces for nested HTML/CSS/JS blocks. Prefer descriptive camelCase for JavaScript variables and functions, such as `renderQuestionBody` or `startMock`.

Asset names should be lowercase kebab-case and match scene slugs:

```text
assets/part1/hotel-lobby.png
assets/part1/train-station.png
```

Avoid adding external dependencies unless they are necessary for a static GitHub Pages app.

## Testing Guidelines

No automated test framework is configured. Manually verify:

- Dashboard loads with no console errors.
- Practice mode starts for Parts 1-7.
- Part 1 displays PNG images and falls back safely if an asset is missing.
- Quiz flow supports select, submit, explanation, next, bookmark, and timer.
- `localStorage` progress survives refresh.
- Responsive layouts work at mobile `390x844`, iPad `768x1024`, iPad landscape `1024x768`, and desktop widths.

## Commit & Pull Request Guidelines

Recent commits use short imperative summaries, for example `Add generated Part 1 image assets`. Follow that style: one clear sentence, capitalized, no trailing period.

Pull requests should include:

- Summary of user-visible changes.
- Testing performed, including viewport checks when UI changes.
- Screenshots or short notes for visual changes.
- Any GitHub Pages or asset-path impact.

## Agent-Specific Instructions

Keep the app static and shareable. Do not introduce secrets, API keys, or server-only assumptions. When replacing generated images, commit the actual asset files and verify they are reachable through GitHub Pages.
