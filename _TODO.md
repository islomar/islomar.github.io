# Blog to-do

Pending work for this blog.
When a task is done, tick it, move it to Done, and add the commit hash or the date.

This repository is public.
Describe tasks without secrets, private folder names, or names of other people.
The leading underscore in this file's name keeps Jekyll from publishing it on the site.

## Open

- [ ] **Confirm the cookie banner with real Google Analytics on islomar.es**
  - In a private window, click Accept and confirm the visit appears in the GA Realtime report.
  - Click Reject under "Cookie settings" and confirm `_ga` and `_ga_6N4V44FDYV` are gone. Automated tests passed with GA data requests blocked (commit `16766a8`).
- [ ] **Review the blog cookie policy**
  - The 2-year cookie durations match Google's "Cookie usage on websites" page (checked 2026-11-05).
  - Check "Google Ireland Limited". The Google pages read so far do not say which entity contracts for this property.
  - Add how long Google keeps the data, from the GA retention setting.
- [ ] **Reconsider vanilla-cookieconsent for the blog banner**
  - Trigger: a second cookie category is added, or an accessibility check finds problems with the banner.
  - Rerun the consent withdrawal test against the real GA script before switching.

## Done

- [x] **Fix the meta description of the blog draft `_drafts/wall-of-kudos.md`**. 2026-11-05.
  - Added an `excerpt:` and moved `<!-- DOCTOC SKIP -->` to the end of the file. A local build shows the description.
- [x] **Stop publishing repository files on the site**. 2026-11-05.
  - An `exclude:` list in `_config.yml` covers `README.md`, `Makefile`, `Dockerfile` and `install-blog-locally.sh`.
- [x] **Fix empty meta descriptions on blog posts**. 2026-11-05, commit `337e833`.
  - Moved `<!-- DOCTOC SKIP -->` to the end of the two affected posts. Other pages fall back to the site description.
- [x] **Turn off VigLink on the blog's Disqus comments**. 2026-11-05, commit `5f661b6`.
  - Affiliate links and Tracking are off in the Disqus admin. VigLink no longer loads.
    The Disqus notice and cookie policy now describe what still loads.

<!-- DOCTOC SKIP -->
