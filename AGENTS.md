## **Project**

This is the HistoryMuseum / Arrivals & Departures 2025 Remake kiosk project.

The site is a static local kiosk-style HTML/CSS/media project. It is edited locally, previewed locally, and later committed through GitHub Desktop after human review.

## **Git and repository rules**

* Work only in the local project folder that was opened.  
* Do not commit.  
* Do not push.  
* Do not pull.  
* Do not create a pull request.  
* Do not create or switch branches unless explicitly instructed.  
* Do not run `git reset`, `git reset --hard`, `git clean`, `git stash`, `git checkout`, `git restore`, or similar destructive/reverting commands unless explicitly approved.  
* Do not delete files unless explicitly approved.  
* It is acceptable to run read-only Git commands such as `git status`, `git diff`, and `git diff --name-only`.  
* At the end of any editing task, report the changed files and summarize the changes.
* First look for shared/global CSS classes that define title, body, caption, figure, media-grid, video, and layout behavior. Prefer fixing or reusing those shared classes instead of adding page-specific inline styles. Remove unnecessary inline overrides when they only exist to force one-off font sizes, caption sizes, widths, or spacing.
*## Visual testing viewport

Default kiosk visual QA viewport is 1920 × 1030.

When checking layout screenshots, always confirm the DevTools device toolbar size is 1920 × 1030 before judging:
- sidebar/leather position
- top navigation position
- parchment fill
- media scale
- bottom spacing
- scroll/no-scroll behavior

If a screenshot uses another viewport size, label it clearly and do not treat shell/sidebar/menu movement as a real layout defect until retested at 1920 × 1030.
* ## Side-by-side layout alignment

When an image/media unit and body text are side by side, the top of the media unit and the top of the body text block should align unless there is a deliberate page-specific reason not to.

Do not vertically center body text against an image by default. Use top alignment for split image/text layouts.

Captions must remain attached to the image/media they describe. If caption text refers to one or more images, it should sit visually with the image or image group, not be placed as ordinary body text beside the image unless explicitly intended.

## Caption line-break cleanup

Readable captions are part of the kiosk design. Do not shrink captions back down to solve wrapping.

If captions become awkward at the correct readable size, manually balance line breaks where needed using controlled `<br>` breaks or cleaner caption wording when approved.

Avoid:
- single-word widows
- awkward two-line breaks
- captions touching the bottom edge
- captions drifting away from the image
- captions becoming part of unrelated body text

When an image/media unit and body text are side by side, the top of the media unit and the top of the body text block should align unless there is a deliberate page-specific reason not to.

Do not vertically center body text against an image by default. Use top alignment for split image/text layouts.

Captions must remain attached to the image/media they describe. If caption text refers to one or more images, it should sit visually with the image or image group, not be placed as ordinary body text beside the image unless explicitly intended.

## Caption line-break cleanup

Readable captions are part of the kiosk design. Do not shrink captions back down to solve wrapping.

If captions become awkward at the correct readable size, manually balance line breaks where needed using controlled `<br>` breaks or cleaner caption wording when approved.

Avoid:
- single-word widows
- awkward two-line breaks
- captions touching the bottom edge
- captions drifting away from the image
- captions becoming part of unrelated body text

## **Delivery rules**

* Do not write directly to the live GitHub repository.  
* Do not create patch, helper, overlay, temporary, duplicate, or workaround files unless explicitly requested.  
* Prefer modifying existing files directly.  
* Keep the number of files down.  
* Do not include or modify `config.js`, `config.sys`, credentials, environment files, or unrelated project configuration unless explicitly requested.  
* If only one file changed, report that one file.  
* If multiple files changed, prepare for changed-files-only ZIP packaging when requested.  
* Always include an explicit list of changed files.

## **Visual/design baseline**

Use the Civil War and Spanish-American War sections as the visual baseline for:

* title size and styling  
* body text size and styling  
* caption size and styling  
* page composition  
* parchment-area layout  
* image/video border treatment  
* navigation consistency

Do not invent a new design system.

All pages in a project section should keep the same look, font behavior, type specs, spacing logic, and media treatment unless a specific page truly requires a controlled exception.

## **Kiosk layout constraints**

* Target kiosk preview is approximately 1920 x 1030\.  
* The usable layout field is the parchment content area to the right of the leather sidebar and below the top navigation.  
* No vertical scrolling.  
* No horizontal scrolling.  
* No content running off the right edge.  
* No content hidden below the fold.  
* Do not center content inside the full browser window; compose inside the usable parchment area.  
* Pages should feel intentionally balanced, not drifting right, cramped, tiny, or floating in dead space.

## **Layout workflow**

Before editing section pages:

1. Read `contentMap.json`.  
2. Identify every target page in the requested section.  
3. Inspect the existing Civil War and Spanish-American War baseline pages.  
4. Classify each target page by layout type.  
5. Inspect media filenames, media type, and image/video dimensions when possible.  
6. Produce an audit table before making layout changes unless the user explicitly says to patch immediately.

Layout types include:

* text-only  
* title/body only  
* single image only  
* single image \+ body text  
* single hero image with caption  
* two images  
* two mismatched images  
* three-image row  
* four-image grid  
* five media items  
* six media items  
* video-only  
* two videos  
* mixed image/video  
* image plus long caption/list  
* dense gallery

Do not use one generic layout rule for every page type.

## **Media and caption rules**

* Captions belong directly under their image or video.  
* Image/video and caption must move as one unit.  
* Captions should usually match the width of the media.  
* Do not place captions as unrelated text columns unless explicitly directed.  
* Do not shrink captions to solve a layout problem.  
* If captions wrap badly, manually balance line breaks where appropriate.  
* Avoid single-word caption widows/orphans.  
* Borders must hug the real image/video.  
* Prefer putting borders directly on `img` or `video`.  
* Do not put a border on a fixed-width wrapper unless the wrapper exactly matches the rendered media size.  
* Do not create fake border boxes.  
* Do not distort, crop, or alter image aspect ratio unless explicitly requested.  
* Do not blindly enlarge or shrink all images.  
* Choose sizing based on actual media aspect ratio and source quality.  
* Media should use available space confidently without causing overflow.

## **Text rules**

* Titles should stay consistent with the established project title style.  
* Do not shrink titles just because a page is awkward.  
* If a title wraps badly, prefer controlled manual line breaks while keeping the standard title style.  
* Body text is usually left-justified.  
* Centered body text is acceptable only on simple title/body pages or when specifically requested.  
* Avoid tall skinny body columns unless there is a real layout reason.  
* If body text visually overpowers the image, rebalance the layout rather than shrinking captions or titles.

## **Link and file-reference rules**

* Remove non-navigation links from kiosk pages unless explicitly instructed otherwise.  
* No PDF photo-credit links.  
* No random local-file links.  
* No external links.  
* Navigation links/buttons are allowed only when part of the kiosk navigation.  
* If asked to use a specific file and it is not found, search for similar filenames, including typo, extension, capitalization, dash/underscore, and numbered variants.  
* If a similar filename is found, report it instead of assuming failure.  
* Example: if `Big_Jet_Plane.jpg` is requested but missing, check for names such as `Big_Jet_Plane.png`, `Big_Jet_plane1.jpg`, `Big-Jet-Plane.jpg`, or `Big_Plane.jpg`.

## **Audit and validation rules**

For any edited section, check:

* `contentMap.json` remains valid JSON if touched.  
* Every target page listed in `contentMap.json` still exists.  
* No `.pdf` references remain in target section HTML unless explicitly approved.  
* No non-navigation anchor tags remain in target section HTML unless explicitly approved.  
* No known broken media paths.  
* No CSS pattern likely to create borders larger than images.  
* No unsafe global `img { width: 100%; }` rule unless proven safe.  
* Captions remain tied to media.  
* Media/caption units remain together.  
* No obvious scroll-prone layout.  
* No tiny media floating in huge unused space.  
* No title restyling just to solve a fit problem.  
* No body text centered unless allowed by the page type.

Do not claim visual verification unless pages were actually rendered or screenshots were inspected. Static code inspection is not visual verification.

## **Communication rules**

* Be explicit about what was inspected.  
* Separate observation from hypothesis.  
* If uncertain, say what is uncertain.  
* Do not claim a file was changed, checked, rendered, or verified unless that actually happened.  
* When producing an audit, include page path, layout type, media count, main issue, and planned fix.  
* When producing edits, include changed files, major fixes, and anything not included.

