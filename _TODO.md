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
  - Check the 2-year cookie durations and "Google Ireland Limited", which were written from memory.
  - Add how long Google keeps the data, from the GA retention setting.
- [ ] **Fix the meta description of the blog draft `_drafts/wall-of-kudos.md` before publishing it**
  - `<!-- DOCTOC SKIP -->` is at the top of the draft, which probably leaves its description empty. Move the marker to the end of the file or add an `excerpt:`.
- [ ] **Reconsider vanilla-cookieconsent for the blog banner**
  - Trigger: a second cookie category is added, or an accessibility check finds problems with the banner.
  - Rerun the consent withdrawal test against the real GA script before switching.
- [ ] **Decide whether to stop publishing repository files on the site**
  - `README.md`, `Makefile`, `Dockerfile` and `install-blog-locally.sh` are served from islomar.es. An `exclude:` list in `_config.yml` would stop that.

## Done

- [x] **Fix empty meta descriptions on blog posts**. 2026-11-05, commit `337e833`.
  - Moved `<!-- DOCTOC SKIP -->` to the end of the two affected posts. Other pages fall back to the site description.
- [x] **Turn off VigLink on the blog's Disqus comments**. 2026-11-05, commit `5f661b6`.
  - Affiliate links and Tracking are off in the Disqus admin. VigLink no longer loads.
    The Disqus notice and cookie policy now describe what still loads.

<!-- DOCTOC SKIP -->
