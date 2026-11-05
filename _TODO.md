# Blog to-do

Pending work for this blog.
When a task is done, tick it, move it to Done, and add the commit hash or the date.

This repository is public.
Describe tasks without secrets, private folder names, or names of other people.
The leading underscore in this file's name keeps Jekyll from publishing it on the site.

## Open

- [ ] **Reconsider vanilla-cookieconsent for the blog banner**
  - Trigger: a second cookie category is added, or an accessibility check finds problems with the banner.
  - Rerun the consent withdrawal test against the real GA script before switching.
- [ ] **Confirm the first post email reaches subscribers**
  - The Mailchimp RSS campaign started on 2026-11-05 and sends daily at 4:00 Madrid time if the feed has new posts.
  - After the next post, check the email arrives and looks right. Then remove the test contact from the audience.
  - Check that the mailing address in the Mailchimp footer is the one you want before that post goes out.
- [ ] **Evaluate replacing Mailchimp with another email platform**
  - Compare how platforms such as MailerLite and ConvertKit handle the postal address required in email footers.
  - Also compare RSS-to-email support, free plan limits, and moving existing subscribers.
- [ ] **Find out why older blog posts show no Disqus reactions**
  - Reactions are enabled for the site. Only the two newest posts show the widget. Low priority.
- [ ] **Find out why Disqus sent no email about a comment**
  - A test comment posted on 2026-11-05 from the admin account produced no email. Check the Disqus email settings, and test with a comment from another account.

## Done

- [x] **Make email subscriptions work**. 2026-11-05.
  - Signup works, new subscriber notifications are on, and the RSS campaign is running. The subscribe form label is in English (commit `4d6f223`).
- [x] **Turn off GA data sharing with Google**. 2026-11-05.
  - All data sharing options in GA Account details are off, so the cookie policy needs no change.
- [x] **Review the blog cookie policy**. 2026-11-05.
  - Google's page confirms the 2-year durations, and the policy now gives the browser limits. The Spanish GA terms name Google Ireland Limited, and the GA account's country is Spain.
  - Added the retention setting: 2 months for event data, 14 months for user data, reset on new activity.
- [x] **Confirm the cookie banner with real Google Analytics on islomar.es**. 2026-11-05.
  - Accept: a visit from a private window appeared in the GA Realtime report. Automated visits got a 204 from GA but did not appear there.
  - Reject: `_ga` and `_ga_6N4V44FDYV` are deleted, and no GA script or request follows on later pages.
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
