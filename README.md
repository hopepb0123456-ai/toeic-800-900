# TOEIC 800-900 Coach

Single-file TOEIC Listening & Reading practice web app designed for iPad, phones, and desktop browsers.

## Features

- Static `index.html` app with no backend and no external dependencies.
- 8-week TOEIC L&R course for an 800-900 target.
- 420 original TOEIC-style practice questions generated from in-app templates.
- Practice modes for Parts 1-7, mini mock, full mock, review misses, and bookmarks.
- Web Speech API playback for Listening with transcript fallback.
- Local progress saved in the browser with `localStorage`.
- Responsive iPad-first layout with large touch targets.
- Part 1 supports real raster scene images in `assets/part1/*.webp`, with built-in SVG fallback when an asset is missing.

## Browser Notes

The app works as a normal static page. Listening playback uses the browser's Web Speech API, so voice quality and support depend on Safari, Chrome, Edge, or the installed system voices. If speech playback is unavailable, open the transcript fallback shown in each listening question.

## GitHub Pages

Recommended deployment:

1. Create a public GitHub repository named `toeic-800-900`.
2. Upload `index.html`, `README.md`, and `.nojekyll`.
3. In repository settings, enable GitHub Pages from branch `main` and folder `/root`.
4. Open `https://<github-username>.github.io/toeic-800-900/` on iPad or phone.

## Scope

This is original practice material inspired by the TOEIC Listening & Reading format. It is not an official ETS product and does not include copied official test questions.

## Part 1 Image Assets

For richer Part 1 visuals, add imagegen or other owned/licensed assets with these filenames:

- `assets/part1/conference-room.webp`
- `assets/part1/warehouse.webp`
- `assets/part1/hotel-lobby.webp`
- `assets/part1/train-station.webp`
- `assets/part1/office-kitchen.webp`
- `assets/part1/copy-center.webp`
- `assets/part1/airport-gate.webp`
- `assets/part1/retail-store.webp`

If any file is missing, the app automatically shows its local SVG fallback instead of a broken image.
