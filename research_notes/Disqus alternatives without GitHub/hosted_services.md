<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents** *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Hosted comment services as Disqus replacements (checked 2026-11-05)](#hosted-comment-services-as-disqus-replacements-checked-2026-11-05)
  - [Is each service operating and maintained?](#is-each-service-operating-and-maintained)
    - [Takeaway](#takeaway)
    - [Summary table](#summary-table)
    - [Cited Findings](#cited-findings)
      - [Active](#active)
      - [Doubtful](#doubtful)
      - [Shut down or dead](#shut-down-or-dead)
      - [Out of scope for this blog](#out-of-scope-for-this-blog)
    - [Inferences](#inferences)
    - [Gaps](#gaps)
  - [What does it cost for under 1,000 monthly views and few comments? Free tier, ads, branding?](#what-does-it-cost-for-under-1000-monthly-views-and-few-comments-free-tier-ads-branding)
    - [Takeaway](#takeaway-1)
    - [Cited Findings](#cited-findings-1)
    - [Inferences](#inferences-1)
    - [Gaps](#gaps-1)
  - [Can visitors comment as guests? What must they provide, and which logins exist?](#can-visitors-comment-as-guests-what-must-they-provide-and-which-logins-exist)
    - [Takeaway](#takeaway-2)
    - [Cited Findings](#cited-findings-2)
    - [Inferences](#inferences-2)
    - [Gaps](#gaps-2)
  - [How is spam handled? How does moderation work, and does the owner get email?](#how-is-spam-handled-how-does-moderation-work-and-does-the-owner-get-email)
    - [Takeaway](#takeaway-3)
    - [Cited Findings](#cited-findings-3)
    - [Inferences](#inferences-3)
    - [Gaps](#gaps-3)
  - [Can comments be exported, and can Disqus data be imported?](#can-comments-be-exported-and-can-disqus-data-be-imported)
    - [Takeaway](#takeaway-4)
    - [Cited Findings](#cited-findings-4)
    - [Inferences](#inferences-4)
    - [Gaps](#gaps-4)
  - [What tracking, cookies and third-party requests does the embed cause? Where is data hosted? Is a DPA available?](#what-tracking-cookies-and-third-party-requests-does-the-embed-cause-where-is-data-hosted-is-a-dpa-available)
    - [Takeaway](#takeaway-5)
    - [Cited Findings](#cited-findings-5)
    - [Inferences](#inferences-5)
    - [Gaps](#gaps-5)
  - [How does it embed on a static site? Can it load after a click? Spanish and English UI?](#how-does-it-embed-on-a-static-site-can-it-load-after-a-click-spanish-and-english-ui)
    - [Takeaway](#takeaway-6)
    - [Cited Findings](#cited-findings-6)
    - [Inferences](#inferences-6)
    - [Gaps](#gaps-6)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Hosted comment services as Disqus replacements (checked 2026-11-05)

Evidence labels used below:

- **[P]**: read on the vendor's own page, docs, repository or package registry.
- **[T]**: my own HTTP check or raw page extraction on 2026-11-05.
- **[S]**: secondary source. Unconfirmed.

Method limit: most vendor pages were read through a page summariser, not line by line. These were checked against raw page text: Hyvor pricing, the CommentBox homepage, FastComments anonymous-comment docs and the Remarkbox homepage. No service was signed up for and no embed was run. Cookie and third-party statements are vendor claims, not network captures.

Snippet-only items: these come from vendor URLs seen through a search-tool summary, and the page itself was not opened, so treat them as weaker than [P]. Hyvor: Disqus import, export formats, spam statuses and the Akismet/FortGuard order, and the "cookie" wording for `ht_{id}_token`. FastComments: Creators limits and the gzip Disqus file. GraphComment: WXR/Disqus XML import (my direct read of the plugin page did not show it, and the pricing page lists only a WordPress import), the 48-hour export deletion and the open-source Disqus middleware. Comentario: Disqus import and JSON export. Talkyard: the forum-sourced import and export items.

## Is each service operating and maintained?

### Takeaway

Four general-purpose services show 2026 activity and fit a static site: Hyvor Talk, FastComments, GraphComment and EchoThread. Talkyard is maintained but quieter. CommentBox.io serves its site, but its public code and policy date from 2021. Remarkbox's marketing page loads, but its app and FAQ hosts returned 504 throughout my check. Cusdis is deprecated and its site is down. Commento's hosted site returns 404. I found no official hosted Comentario.

### Summary table

| Service | Status evidence | Cost for this blog | Ads | Guest with no account | ES UI | EU data | DPA |
|---|---|---|---|---|---|---|---|
| FastComments (EU region) | Active: docs pushed 2026-11-04 | Flex: $0.99 base plus usage, no free tier | None | Yes: name plus any email by default (need not be valid); name-only after enabling anonymous mode | Yes | Yes | Yes, automatic |
| Hyvor Talk | Active: update dated 2026-07-08 | €50 a year (Personal), no free tier | None | Yes, name only | Yes | Hetzner Germany, plus US sub-processors | Yes, sign and email |
| GraphComment | Active: plugin 2026-09-12, DPA 2026-10-09 | Free, up to 1M data loads | None on self-serve plans | Stated for WordPress only, unconfirmed for static | Yes | Yes, location conflict | Yes, public |
| Talkyard | Release 2026-07-10 | About €4 a month, inferred, no free tier | None claimed | Optional, name details unverified | Unknown | Unknown | Unclear |
| EchoThread | Page updated 2026-11-05 | Free: 50 approved comments a month, badge | None claimed | Yes, display name | **No** | **No, US** | Not mentioned |
| CommentBox.io | Site up; code and policy from 2021 | Free: 100 comments a month | None claimed | Optional anonymous, fields unverified | Unknown | **No, US** | Not mentioned |
| Remarkbox | **App and FAQ hosts 504 on 2026-11-05** | Pay what you can, from $0 | None claimed | Email required | Unknown | Unknown | Unknown |
| ReplyBox | Site up, © 2026 | Paid after 14-day trial, price not read | Unknown | Not mentioned | Unknown | Unknown | Unknown |
| Cusdis hosted | **Deprecated, repo archived, site 521** | n/a | n/a | n/a | n/a | n/a | n/a |
| Commento hosted | **commento.io 404** | n/a | n/a | n/a | n/a | n/a | n/a |
| Comentario | Software active, no hosted offer found | Self-host only | None | Yes, if self-hosted | Yes | Your choice | Your own |

### Cited Findings

#### Active

- FastComments [P/T]: the `FastComments/fastcomments-docs` repository was last pushed 2026-11-04 ([GitHub](https://github.com/FastComments/fastcomments-docs)). The privacy policy was updated 2026-10-05 ([policy](https://fastcomments.com/privacy-policy)). The DPA is dated 2026-08-05 ([DPA](https://eu.fastcomments.com/dpa)). A blog post is dated 2026-10-10 ([blog](https://blog.fastcomments.com/(10-10-2026)-how-to-migrate-from-openweb-to-fastcomments-in-2026.html)).
- Hyvor Talk [P]: the quarterly update dated 2026-07-08 reports a new hooks feature. It also says Hyvor Talk Newsletters will be discontinued in Q3 2026 so the team can focus on commenting ([update](https://hyvor.com/blog/hyvor-quarterly-update-q2-2026)). I found no changelog: `hyvor.com/talk/changelog` returned 404 [T].
- GraphComment [P]: WordPress plugin version 5.1.0, updated 2026-09-12 per the page header, while the same page's metadata says "2 months ago" ([plugin](https://en-gb.wordpress.org/plugins/graphcomment-comment-system/)). DPA last updated 2026-10-09 ([DPA](https://www.graphcomment.com/en/dpa)). GDPR page last updated 2026-07-31 ([GDPR page](https://developers.graphcomment.com/docs/gdpr-eu-data-residency)).
- EchoThread [P]: pages show "Updated 2026-11-05", and the privacy policy is effective 2026-10-23 ([privacy](https://echothread.io/privacy)). The vendor describes it as one person with no VC, made by Yoni Ryabinski ([home](https://echothread.io/)). The legal entity is VectraSEO LLC, Pennsylvania ([privacy](https://echothread.io/privacy)). Its "best commenting system" article is self-promotion and was not used for facts about other vendors ([article](https://echothread.io/blog/best-commenting-system-for-static-sites)).
- Talkyard [P/T]: latest commit is a merge of `v1.2026.004` on 2026-07-10, and the repository is not archived ([GitHub](https://github.com/debiki/talkyard)). The talkyard.io footer reads "Copyright 2012–2025" ([site](https://www.talkyard.io/)).
- Comentario software [P/T]: release v3.19.0 on 2026-10-16 and v3.18.0 on 2026-08-14 ([GitLab](https://gitlab.com/comentario/comentario/-/releases), read through the GitLab API).

#### Doubtful

- CommentBox.io [P/T]: the site serves and advertises its plans ([home](https://commentbox.io/)). The privacy page footer reads "© 2021" and still names the EU-US Privacy Shield ([privacy](https://commentbox.io/privacy)). The site repository's last commit is 2021-04-05 and last push 2023-01-07 ([GitHub](https://github.com/forward-motion/commentbox.io)). The npm package's latest version, 2.1.0, was published 2021-04-04 ([npm](https://www.npmjs.com/package/commentbox.io)).
- Remarkbox [P/T]: `www.remarkbox.com` loads and shows "© 2016-2026" ([home](https://www.remarkbox.com/)). `my.remarkbox.com` and `faq.remarkbox.com` returned HTTP 504 on three consecutive tries, and an earlier FAQ fetch timed out [T]. It may be a transient outage. I could not check its history.
- ReplyBox [P]: site up with "© 2026" ([home](https://getreplybox.com/)). No activity date read.
- HTML Comment Box [T]: site up. The vendor's own page shows a "[Your Ad Here.]" slot and a replica-watch advertisement ([site](https://www.htmlcommentbox.com/)).

#### Shut down or dead

- Cusdis: the README states "Cusdis is deprecated now" and tells users to email <hi@cusdis.com> for a data export ([README](https://raw.githubusercontent.com/djyde/cusdis/master/README.md)). The repository is archived, last commit 2026-07-17 ([GitHub](https://github.com/djyde/cusdis)). `cusdis.com` returned HTTP 521 [T]. **Mid-2026 comparison posts still recommend its free cloud tier and are out of date** ([example, S](https://merginit.com/blog/21062026-free-commenting-platforms-comparison)).
- Commento hosted: `commento.io` returned 404 [T]. I found no official shutdown notice. A user declared it dead and described sporadic cloud failures ([S](https://buttondown.com/mdickens/archive/rest-in-peace-commento-long-live-comentario/)). Ghost removed its integration for unreliability and unanswered support ([S](https://forum.ghost.org/t/commento-integration-page-gone/11991)). The docs site still describes the cloud option ([docs](https://docs.commento.io/installation/cloud-service/)).
- HyperComments: `hypercomments.com` now serves a Thai-language gambling page, so the service is gone [T].
- JustComments: `justcomments.com` only redirects to a `/lander` page, which looks like a parked domain [T].

#### Out of scope for this blog

- Comentario hosted: the [docs](https://docs.comentario.app/en/) and [site](https://comentario.app/en/) describe no paid hosting. `cloud.comentario.app` did not respond [T]. Railway deploy templates exist, but you still operate the instance ([Railway](https://railway.com/deploy/comentario)). A review site claims a managed option that is not prominently listed; unconfirmed ([S](https://unsubbed.pages.dev/tools/comentario/)).
- Commentics: PHP script installed on your own server ([site](https://commentics.com/)). GitHub Pages cannot run it. A "Commentics hosting" page belongs to a cloud provider, not the project ([S](https://cyfuture.cloud/kb/cloud-computing/commentics-hosting-secure-comment-system-hosting-for-content-platforms)).
- Cove: tools for Ghost sites, about $7.50 to $10.50 a month billed yearly ([site](https://cove.chat/)).
- Replyke: `replyke.com/pricing` redirects to Sublay, "infrastructure for user-based products". Free tier: 500 monthly active users and 250k API calls. Its pricing page mentions neither guest comments nor a static embed ([pricing](https://sublay.io/pricing)).
- Cactus Comments: federated comments on Matrix, with a community server funded through OpenCollective ([site](https://cactus.chat/)). Guest terms not read.

### Inferences

- Remarkbox should not be chosen until its hosts respond. If the embed depends on `my.remarkbox.com`, comments are currently unavailable.
- CommentBox.io looks like an unattended service that still bills and runs. The risk is silent shutdown with a 2021-era privacy policy.
- "Replyke is now Sublay" is inferred from the redirect. The Sublay page does not mention Replyke.
- Many comparison posts are stale or vendor-written. Cusdis shows the risk.

### Gaps

- No status page was found for FastComments or Hyvor at the hostnames I tried (`status.fastcomments.com`, `status.talk.hyvor.com`). Other hostnames may exist.
- I found no independent 2026 user reports on any of these services.
- IntenseDebate and Vuukle respond on HTTP, but I did not evaluate them. Vuukle markets itself as "Engage. Monetize. Measure." [T].

## What does it cost for under 1,000 monthly views and few comments? Free tier, ads, branding?

### Takeaway

Free options without ads: GraphComment (1M data loads) and EchoThread (50 approved comments a month, with a badge). CommentBox.io is also free, up to 100 comments a month, but has the maintenance doubts above. The cheapest paid options are FastComments Flex, about $1 a month by my estimate, and Hyvor Personal at €50 a year, which keeps Hyvor branding.

### Cited Findings

- **FastComments** [P]: no free tier, 30-day trial with no card. Flex has a $0.99 base plus $1 per 100,000 page loads and $1 per 100,000 stored comments. First site and first admin are free. Monthly spend caps can be set. De-branding is included on Flex, and yearly payment is not available on it ([pricing](https://fastcomments.com/traffic-pricing)). Creators is $5.99 a month or $59 a year, with 500,000 page loads, 5,000 comments and 3 sites, without de-branding ([comparison page](https://fastcomments.com/disqus-alternative); limits via [search of the pricing pages](https://fastcomments.com/pricing-calculator)). Never shows ads, per the vendor ([comparison page](https://fastcomments.com/disqus-alternative)).
- **Hyvor Talk** [P/T]: no free tier, 14-day trial with no card. Personal: "€5 /month*, billed annually at €50", 1 website, 1 moderator, 2,500 credits a month. Comments embed load is 1 credit. Comment count is 0.5 credits. An Akismet check is 10 credits and a FortGuard check 20 credits after an allowance. Exceeding the limit two consecutive months temporarily disables embeds. "No Hyvor Talk branding" comes with Business at €40 a month, so Personal keeps branding ([pricing](https://hyvor.com/talk/pricing)). "We never add affiliate links, tracking codes, or ads to your site" ([product page](https://hyvor.com/talk)).
- **GraphComment** [P]: free "basic" plan, up to 1,000,000 data loads and 100 AI analyses a month. Starter is $29 a month, $25 billed annually. Self-serve plans have no ads. Enterprise offers "monetized discussions". Outside WordPress, the free plan loads in an iframe, so comments do not count for your page in search engines. The page does not say whether GraphComment branding is shown ([pricing](https://www.graphcomment.com/en/pricing)).
- **EchoThread** [P]: Hobby is $0: 1 personal site, 5,000 page views, 50 approved comments a month. Comments pause only after a second consecutive month over the limit. Hobby shows a community badge, removed on Starter and above. Starts from $5 a month per the page title. "No ads and no trackers on any plan" ([pricing](https://echothread.io/pricing/)).
- **CommentBox.io** [P/T]: Personal is free: 100 comments a month, unlimited page views, basic moderation, "$15 if over comment limit". Professional is $10 a month. "No ads. No Tracking. Just Comments." ([home](https://commentbox.io/)).
- **Talkyard** [P]: Standard is €4 a month per active coworker, excluding VAT, with a one-month trial and no card. Admins and moderators count as coworkers. No free tier is listed ([pricing](https://www.talkyard.io/pricing)). An old page says "Starting at €1.9 per month" with a 2021 footer ([old page](https://forum.talkyard.io/blog-comments)). The 2021 forum mentions an "Almost Free" plan ([forum](https://forum.talkyard.io/-541/talkyard-hosted-comments-and-gdpr-ccpa)). Neither appears on the current pricing page.
- **Remarkbox** [P]: "Pay what you can", listed at $0 a month for one moderator on a few domains. "Absolutely NO ADS" ([home](https://www.remarkbox.com/)).
- **ReplyBox** [P]: 14-day trial, then charged. Smallest slider point is 20k page views. The price itself renders by script and I could not read it ([pricing](https://getreplybox.com/pricing/)).
- **HTML Comment Box** [P]: "free plan available". The pricing URL I tried returned "not found" ([site](https://www.htmlcommentbox.com/)).

### Inferences

- FastComments Flex for this blog: 1,000 page loads cost about $0.01, so the bill should be about $1 a month. This is my arithmetic and the bill is not confirmed.
- Hyvor Personal: 2,500 credits comfortably covers under 1,000 views, and a click-to-load button lowers embed loads further.
- Hyvor's free spam allowance scales with credits: 10,000 checks on 1M credits. By the same ratio Personal gets about 25 checks. Few comments means this should not matter, but I did not confirm the ratio applies at that tier.
- EchoThread's 50 approved comments and CommentBox's 100 comments are far above this blog's zero real comments so far. CommentBox's $15 overage is the only surprise-cost risk on these free plans.

### Gaps

- FastComments does not say what the $0.99 base covers or whether it is a minimum.
- Whether Hyvor's Personal plan can be billed monthly: the page shows an asterisk with annual billing and lists "Monthly billing options" only under higher plans.
- Whether GraphComment's free widget shows GraphComment branding.
- Whether Talkyard's sole-owner blog pays exactly one €4 seat. The pricing page does not say.
- Whether HTML Comment Box's free widget shows ads. It was not confirmed, so it fails the no-ads requirement until checked.

## Can visitors comment as guests? What must they provide, and which logins exist?

### Takeaway

No candidate requires GitHub. Hyvor, EchoThread and FastComments (once anonymous mode is on) all accept a guest with a name only. FastComments is not name-only by default, contrary to what its marketing suggests. GraphComment's guest commenting is confirmed only on its WordPress plugin page. Remarkbox requires an email.

### Cited Findings

- **Hyvor Talk** [P]: "name (required) and email (optional)". Guests cannot edit or delete their comments. Website owners can see the email. Guest commenting is on by default, and sites can turn it off. Otherwise a site uses a HYVOR account or its own SSO ([commenting guide](https://hyvor.com/talk/docs/commenting)).
- **FastComments** [P/T]: "By default, FastComments will require an email to comment." The email need not be valid, but the comment shows an "Unverified Comment" label until the link is clicked. Enabling anonymous commenting makes email optional. A username stays required, unless you set a shared default or generate one per visitor. Email fields can be removed completely. A label can be disabled with `disableUnverifiedLabel`. "Usernames that a visitor types themselves still have to be unique." Removal of unverified comments after a set number of days is optional and off by default ([docs](https://docs.fastcomments.com/guide-customizations-and-configuration.html)).
- **GraphComment** [P]: "Your readers comment without creating an account" and "Guest commenting is on by default" on the WordPress plugin page ([plugin](https://en-gb.wordpress.org/plugins/graphcomment-comment-system/)). A vendor blog also claims guest support ([blog](https://blog.graphcomment.com/en/disqus-vs-graphcomment/)). The pricing page mentions only sign-in with "Facebook, Twitter, Google+" ([pricing](https://www.graphcomment.com/en/pricing)).
- **EchoThread** [P]: guests post with a display name. Logins: Google, GitHub, X, Facebook, Discord, Bluesky, Mastodon. GitHub is optional ([home](https://echothread.io/)).
- **CommentBox.io** [P/T]: "Optional anonymous posting" and "Choose from social or email login" ([home](https://commentbox.io/)). Its privacy policy names Firebase Auth for logins ([privacy](https://commentbox.io/privacy)).
- **Talkyard** [P]: "enable quick no-signup-needed guest comments" ([site](https://blog-comments.talkyard.io/)).
- **Remarkbox** [P/S]: no signup or password, but the visitor gives an email and gets a verification message ([home](https://www.remarkbox.com/)). Unverified comments stay in limbo, and owners may display only verified ones ([FAQ snippet via search, FAQ unreachable on direct read](https://faq.remarkbox.com/6b2a42ae-6796-11e8-ad95-040140774501)).
- **ReplyBox** [P]: login with Google or Twitter. Guest commenting is not mentioned ([home](https://getreplybox.com/)).
- **Comentario, self-hosted** [P]: optional commenting without registration including anonymous comments. Social login: Google, X, Facebook, GitHub, GitLab, Apple ([features](https://docs.comentario.app/en/about/features/)).

### Inferences

- FastComments' name-uniqueness rule could reject a common typed name such as "Juan" with a "taken" message. A default or generated username avoids it, at the cost of less identity.
- GraphComment's guest mode must be tested on a static embed before relying on it. The non-WordPress documentation I read does not confirm it, and the pricing page's mention of Google+ suggests stale copy.

### Gaps

- Exact fields on GraphComment, CommentBox and Talkyard guest forms. I found no documentation of them.
- Whether Hyvor's HYVOR account offers social sign-in. The guide lists only HYVOR account and SSO.
- FastComments' built-in social logins. Not found in the pages I read.

## How is spam handled? How does moderation work, and does the owner get email?

### Takeaway

Pre-approval is documented for Hyvor, FastComments, EchoThread, ReplyBox and, for first comments, Talkyard. I did not confirm it for GraphComment's static embed or CommentBox. Spam filtering is the bigger privacy choice: Hyvor's default filter is Akismet (US), FastComments' optional AI features use a US provider with no contract in place, and GraphComment sends text to Mistral (EU) by default. For a blog with few comments, pre-moderating everything and turning off third-party filters is a workable setup, but check that the owner email exists first.

### Cited Findings

- **Hyvor Talk** [P]: comments are published, pending, deleted or spam. Rules run first, then the spam service. Akismet is the default and FortGuard is the LLM option. Reputation of 20 or more bypasses detection ([spam docs](https://talk.hyvor.com/docs/spam)). Pre-moderation holds all comments until a moderator approves them, per page or site-wide ([moderation](https://hyvor.com/talk/docs/moderation)). A 2021 post says moderators can reply to notification emails to moderate ([post, 2021-02-08](https://hyvor.com/blog/moderation-update)). Users get emails for replies and mentions ([notifications](https://hyvor.com/talk/docs/notifications)).
- **FastComments** [P]: "trainable spam detection" on by default. Comments are auto-approved by default. Manual approval can apply to all comments or a user's first comment. "Only Auto Approve Verified Comments" holds unverified ones. Moderators and admins can get daily, weekly or monthly digests with magic links to approve, review or mark spam. Admins can opt out of reply emails but keep "new comment notifications" ([moderation](https://docs.fastcomments.com/guide-moderation.html)). Automated spam classification via Deep Infra is off by default ([DPA](https://eu.fastcomments.com/dpa)).
- **GraphComment** [P]: insult filtering, banning, multiple moderators, AI Moderation Assist with 100 free analyses and trusted-member auto-approval. Moderation notices come from GraphComment ([plugin](https://en-gb.wordpress.org/plugins/graphcomment-comment-system/)). Mistral AI moderation is on by default and can be disabled ([DPA](https://www.graphcomment.com/en/dpa)).
- **EchoThread** [P]: every comment is scored by Siftfy. Clear spam is hidden and uncertain comments are queued. Manual or auto approval. Notification bell for new comments and spam ([home](https://echothread.io/)).
- **CommentBox.io** [P]: basic moderation on free. Filters, shadow bans and thread locks need Moderation Plus at $20 a month per 5K comments ([home](https://commentbox.io/)).
- **Talkyard** [P/S]: review each new visitor's first N comments ([site](https://blog-comments.talkyard.io/)). Akismet and Stopforumspam were in use in 2021 ([forum, S-dated](https://forum.talkyard.io/-541/talkyard-hosted-comments-and-gdpr-ccpa)).
- **ReplyBox** [P]: Akismet plus other methods, optional manual approval ([home](https://getreplybox.com/)).

### Inferences

- FastComments' "spam detection on by default" and "automated spam classification off by default" seem to describe two different mechanisms. The docs do not say so explicitly.
- Default settings on FastComments auto-approve. An owner wanting pre-approval must change them.

### Gaps

- Current Hyvor documentation on emails to moderators for new comments. The moderation and notifications pages each point elsewhere, and only the 2021 post confirms it.
- Whether FastComments emails per comment or only in digests. "New comment notifications" appears, without detail.
- EchoThread email alerts to the owner: only a dashboard bell is described.
- Remarkbox spam and moderation: FAQ unreachable.

## Can comments be exported, and can Disqus data be imported?

### Takeaway

FastComments, Hyvor and EchoThread have documented Disqus import and self-service export. GraphComment documents Disqus import on its plugin and an admin export, format unconfirmed. Import matters little here since the blog has zero real comments. Export is the more useful exit guarantee.

### Cited Findings

- **Hyvor Talk** [P]: Disqus import in the Console; imported comments become guest comments ([import](https://talk.hyvor.com/docs/import)). Export via Console API emails a link; formats are Hyvor JSON, WordPress XML and subscribers CSV ([API](https://hyvor.com/talk/docs/api-console)).
- **FastComments** [P]: Disqus importer under Manage Data, then Import; the file is XML, gzip-compressed ([comparison page](https://fastcomments.com/disqus-alternative), [migrations](https://docs.fastcomments.com/guide-migrations.html)). Dashboard export is CSV, also available by API ([migrations](https://docs.fastcomments.com/guide-migrations.html)).
- **GraphComment** [P]: Plugin accepts WXR or Disqus XML in one file. "An export tool is available in the administration of your website" ([plugin](https://en-gb.wordpress.org/plugins/graphcomment-comment-system/)). Pricing FAQ says you can back up and restore data from the browser, and that page lists only a WordPress import ([pricing](https://www.graphcomment.com/en/pricing)). A vendor middleware for Disqus export is open source, and export files are deleted 48 hours after download (via vendor pages surfaced by search; [GDPR page](https://developers.graphcomment.com/docs/gdpr-eu-data-residency)).
- **EchoThread** [P]: Disqus or WXR import; JSON or CSV export; included on Hobby ([pricing](https://echothread.io/pricing/)).
- **CommentBox.io** [P]: "Export your comments on demand, directly from the dashboard" ([home](https://commentbox.io/)). No format stated and no import stated.
- **Talkyard** [S/P]: Disqus import script exists, and users report the maintainer runs the import on request ([forum](https://forum.talkyard.io/-67/bulk-import-from-disqus), [how-to](https://forum.talkyard.io/-620/how-to-import-discussions-to-talkyard)). JSON backup can move to a self-hosted server ([forum](https://site-e7ef490a72.talkyard.io/-285/export-from-hosted-version-to-self-hosted-version)).
- **ReplyBox** [P]: Disqus import is "an up-coming feature" ([FAQs](https://getreplybox.com/faqs/)).
- **Comentario, self-hosted** [P]: Disqus import in the admin UI ([guide](https://docs.comentario.app/en/installation/migration/disqus/)) and JSON export ([migration](https://edge.docs.comentario.app/en/installation/migration/)).

### Inferences

- A Hyvor JSON or EchoThread JSON export is easiest to convert into static comments later. FastComments' CSV also works. Conversion was not tested.

### Gaps

- GraphComment export format and whether Disqus import is available to non-WordPress sites.
- Remarkbox import and export: pages unreachable or silent.

## What tracking, cookies and third-party requests does the embed cause? Where is data hosted? Is a DPA available?

### Takeaway

FastComments' EU region has the clearest paper trail: EEA hosting, an automatic DPA, named sub-processors, and a stated functional-only cookie. Its operator is a US company relying on SCCs. GraphComment is French-operated with a public DPA, but its own documents disagree on the primary host. Hyvor is French with Hetzner Germany hosting, a sign-and-email DPA, and US sub-processors. CommentBox.io and EchoThread store data in the US and mention no DPA, so they fit a Spanish owner worst.

### Cited Findings

- **FastComments** [P]: "Only first party cookies are used" for commenting. One authentication cookie when installed on a customer site. Tracking cookies exist only on the marketing site. Raw commenter IPs are not stored; they are salted and hashed ([policy](https://fastcomments.com/privacy-policy)). The vendor says no cookie banner is needed for it ([comparison page](https://fastcomments.com/disqus-alternative)). EU accounts on `eu.fastcomments.com` stay in the EU. Global accounts are replicated across regions including the US and Brazil ([policy](https://fastcomments.com/privacy-policy), [DPA](https://eu.fastcomments.com/dpa)).
- **FastComments DPA** [P]: version 1.0, effective 2026-08-05, automatic with no signature. EU sub-processors: Hetzner (Germany, Finland), OVH (France, Germany), Wasabi (Frankfurt), Akamai (Frankfurt), Mailgun (EU), Brevo (France, Belgium). Operator WinrickLabs LLC is not Data Privacy Framework certified and relies on SCCs Module Two. Remote administration from the US counts as a third-country transfer. Deep Infra (US) is used only if AI features are enabled. It "does not publish a data processing agreement or standard contractual clauses, and no such contract is in place as at 5 August 2026" ([DPA](https://eu.fastcomments.com/dpa)).
- **Hyvor Talk** [P]: no ads or tracking codes ([product](https://hyvor.com/talk)). `ht_{id}_token` authentication token for 180 days in local storage; `talksess` for 15 minutes; `authsess` for HYVOR login. IPs are collected only if the owner enables it. One error tool and no analytics. Policy last updated 2024-08-01 ([privacy](https://hyvor.com/talk/privacy)). A search snippet of Hyvor's docs calls the token a cookie, which conflicts with the policy's local storage description. I did not identify the exact page.
- **Hyvor DPA and hosting** [P]: "HYVOR offers a Data Processing Agreement": download, sign, send to <privacy@hyvor.com>. SCCs for transfers outside the EEA ([compliance](https://hyvor.com/compliance)). Sub-processors: Hetzner (Germany, hosting), Cloudflare (US, DNS/CDN), Mailgun (US), Sentry (US), Crisp (France), Stripe (US), AWS (US company, EU servers), Akismet (US), FortGuard (France) ([list](https://hyvor.com/sub)). The script loads from `talk.hyvor.com` ([docs](https://hyvor.com/talk/docs/comments)).
- **GraphComment** [P]: operated by SEMIOLOGIC, Aix-en-Provence. Session token in memory, not browser storage, on the standard embed. Audience counting uses aggregated counters without cookies or persistent identifiers. Scripts come from the vendor's own infrastructure, not a third-party CDN. The widget reads consent via `window.__tcfapi`, and telemetry can be gated behind a CMP ([GDPR page, 2026-07-31](https://developers.graphcomment.com/docs/gdpr-eu-data-residency)).
- **GraphComment conflict** [P]: the GDPR page names Iguane Services (Paris) as primary host and says data is stored in France ([GDPR page, 2026-07-31](https://developers.graphcomment.com/docs/gdpr-eu-data-residency)). The later DPA lists DigitalOcean, LLC, Amsterdam, as primary host, Scaleway Paris as backup, Brevo Paris for email, Mistral France on by default, and Stripe US for paid plans only. It describes no safeguards for transfers ([DPA, 2026-10-09](https://www.graphcomment.com/en/dpa)). Both are EU locations.
- **EchoThread** [P]: VectraSEO LLC, data in AWS US East (N. Virginia), processed in the US. No first-party cookies. Local and session storage for sign-in and UI state. KLIPY (GIFs) is the one third party the widget contacts. IP and user agent collected on comment submission. The policy mentions no DPA ([privacy](https://echothread.io/privacy)). The script loads from `cdn.echothread.io` ([home](https://echothread.io/)).
- **CommentBox.io** [P]: most datacenters in the US. Firebase Auth, Google storage, Stripe, SparkPost, Algolia. No third-party analytics. Login state in local storage. Transfers rely on standard contractual arrangements or the EU-US Privacy Shield. No DPA or GDPR mention by name ([privacy](https://commentbox.io/privacy)). Docs load the script from unpkg.com ([docs](https://commentbox.io/docs)).
- **Talkyard** [S-dated]: 2021 maintainer post names Amazon SES, Google Cloud and Akismet, and says a DPA was being written ([forum](https://forum.talkyard.io/-541/talkyard-hosted-comments-and-gdpr-ccpa)). Vendor claims no ads and no tracking ([GitHub](https://github.com/debiki/talkyard)).
- **Comentario, self-hosted** [P]: no tracking scripts or pixels and no ads. Collects country, browser and language statistics. IP collection off by default ([features](https://docs.comentario.app/en/about/features/)).

### Inferences

- For FastComments, the owner must sign up on `eu.fastcomments.com`, not the default domain, and leave AI features off. Otherwise data replicates outside the EU or reaches a sub-processor with no contract in place.
- CommentBox's reference to the EU-US Privacy Shield suggests an old policy. I did not source the legal status of the Privacy Shield in this research.
- GraphComment's two documents disagree on host. The DPA is newer and has legal force, so I would treat it as the accurate one, and ask <dpo@semiologic.fr> to confirm.
- FastComments' "first party" cookie claim needs checking on the actual embed. If the cookie sits on a FastComments domain, it may behave as third-party relative to the blog. Click-to-load avoids any of these requests before consent in every case.
- A cookie-banner decision still belongs to the owner. Vendor claims about banners are not legal advice.

### Gaps

- No network capture of any embed. Doing that would confirm the real requests and cookies.
- Hyvor's commenter data location is inferred from the Hetzner entry. The compliance page does not state a location.
- Talkyard's current hosting location, privacy terms and DPA: `talkyard.io/privacy-policy` returned 404. I did not find the current page.
- Remarkbox and ReplyBox: no privacy page read.

## How does it embed on a static site? Can it load after a click? Spanish and English UI?

### Takeaway

All candidates embed with a script and a container, so Jekyll fits. Hyvor has the cleanest native click-to-load, using `loading="manual"` and `.load()`. Spanish is confirmed for Hyvor, FastComments, GraphComment and self-hosted Comentario. EchoThread has no Spanish, which fails the bilingual need unless that changes.

### Cited Findings

- **Hyvor Talk** [P]: `<script async src="https://talk.hyvor.com/embed/embed.js" type="module">` with a `<hyvor-talk-comments>` element. `loading` accepts `default`, `lazy` or `manual`; manual starts when `.load()` is called. `page-language` overrides the language per page ([docs](https://hyvor.com/talk/docs/comments)). More than 30 languages including `es` ([language docs](https://hyvor.com/talk/docs/language)).
- **FastComments** [P]: script from `cdn.fastcomments.com`, plus a `fastcomments-widget` div and config. EU hostnames exist, for example [`cdn-eu.fastcomments.com`](https://cdn-eu.fastcomments.com/traffic-pricing) and [`eu.fastcomments.com`](https://eu.fastcomments.com/dpa); the EU embed snippet itself was not read. `useShowCommentsToggle` hides the thread behind a button, but "The button is not shown if there are no comments" ([docs](https://docs.fastcomments.com/guide-customizations-and-configuration.html)). `en_us` and `es_es` are listed locales; default follows the browser; `locale` sets it per embed ([languages](https://docs.fastcomments.com/guide-supported-languages.html)).
- **GraphComment** [P]: `<div id="graphcomment">` plus a script from `integration.graphcomment.com/gc_graphlogin.js` calling `__semio__gc_graphlogin(__semio__params)`. It runs in an iframe. No build step ([docs](https://developers.graphcomment.com/docs/getting-started)). The docs describe no on-demand option. A blog claim of IntersectionObserver loading is not confirmed in the docs ([blog](https://blog.graphcomment.com/en/disqus-vs-graphcomment/)). Widget languages: 21 on pricing including ES, 23 on the demo page ([pricing](https://www.graphcomment.com/en/pricing), [demo](https://www.graphcomment.com/en/demo)). Automatic detection.
- **EchoThread** [P]: one `div` plus one script, no iframe. Languages: English, Korean, Italian, Simplified Chinese, Modern Greek; `data-lang` pins one. Spanish is not listed ([home](https://echothread.io/)).
- **CommentBox.io** [P]: HTML snippet and `commentBox('my-project-id')` ([docs](https://commentbox.io/docs)). No language information found.
- **Talkyard** [P]: copy-paste tags, with instructions for Jekyll, Ghost, Hugo and others. 140 KB of JavaScript ([site](https://blog-comments.talkyard.io/)). No language information found.
- **Comentario, self-hosted** [P]: `<comentario-comments>` with a `lang` attribute ([tag docs](https://docs.comentario.app/en/configuration/embedding/comments-tag/)). `es.yaml` and `en.yaml` exist in the repository [T] ([GitLab](https://gitlab.com/comentario/comentario/-/tree/master/resources/i18n)).

### Inferences

- The blog's existing click-to-load button can inject the vendor script on click for FastComments, GraphComment, EchoThread and CommentBox, without any vendor feature. This avoids FastComments' zero-comment button problem. I did not test it on any vendor.
- With one embed per post, the language can come from the Jekyll post's language: `page-language` on Hyvor and `locale` on FastComments.
- Ranking for this blog, under the stated requirements:
  1. **FastComments Flex in the EU region**: strongest GDPR paper trail, about $1 a month, no branding, Spanish. Costs: anonymous mode must be turned on, and the operator is a US LLC.
  2. **GraphComment free**: EU-operated, free, Spanish. Run a guest-comment test on a static page first. Branding and the host conflict remain open.
  3. **Hyvor Talk Personal**: best native embed fit, French operator, name-only guests by default. €50 a year and keeps branding.
- **Not recommended**: EchoThread (no Spanish, US hosting, no DPA mention), CommentBox.io (2021-era evidence, US hosting), Remarkbox (504s, required email), Talkyard (€4 a month for a forum-scale product, unclear DPA).

### Gaps

- FastComments' exact EU embed script hostname on a real account.
- Whether the toggle button text is translated in `es_es`.
- Talkyard and CommentBox language lists. Talkyard's guest form language is untested.
- Whether a script-injected-after-click embed works on each vendor. A short test on one post would settle it.
