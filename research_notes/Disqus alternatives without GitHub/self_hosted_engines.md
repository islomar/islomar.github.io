<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents** *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Self-hosted, open-source comment engines as Disqus replacements (as of 2026-11-05)](#self-hosted-open-source-comment-engines-as-disqus-replacements-as-of-2026-11-05)
  - [What are the latest release date, recent commit activity and open issue state? Is the project a one-person effort?](#what-are-the-latest-release-date-recent-commit-activity-and-open-issue-state-is-the-project-a-one-person-effort)
    - [Takeaway](#takeaway)
    - [Cited Findings](#cited-findings)
    - [Inferences](#inferences)
    - [Gaps](#gaps)
  - [Can visitors comment as guests with no account? What must they provide? Which logins are supported?](#can-visitors-comment-as-guests-with-no-account-what-must-they-provide-which-logins-are-supported)
    - [Takeaway](#takeaway-1)
    - [Cited Findings](#cited-findings-1)
    - [Inferences](#inferences-1)
    - [Gaps](#gaps-1)
  - [What does it need to run? What is the monthly hosting cost, what are the free tier limits, and how much maintenance does it take?](#what-does-it-need-to-run-what-is-the-monthly-hosting-cost-what-are-the-free-tier-limits-and-how-much-maintenance-does-it-take)
    - [Takeaway](#takeaway-2)
    - [Cited Findings](#cited-findings-2)
    - [Inferences](#inferences-2)
    - [Gaps](#gaps-2)
  - [How is spam handled? How does moderation work, is there pre-approval, and how does the owner get notified?](#how-is-spam-handled-how-does-moderation-work-is-there-pre-approval-and-how-does-the-owner-get-notified)
    - [Takeaway](#takeaway-3)
    - [Cited Findings](#cited-findings-3)
    - [Inferences](#inferences-3)
    - [Gaps](#gaps-3)
  - [Can comments be exported or backed up? Can Disqus data be imported?](#can-comments-be-exported-or-backed-up-can-disqus-data-be-imported)
    - [Takeaway](#takeaway-4)
    - [Cited Findings](#cited-findings-4)
    - [Inferences](#inferences-4)
    - [Gaps](#gaps-4)
  - [What tracking, cookies and third-party requests does the embed cause? Can it be hosted in the EU?](#what-tracking-cookies-and-third-party-requests-does-the-embed-cause-can-it-be-hosted-in-the-eu)
    - [Takeaway](#takeaway-5)
    - [Cited Findings](#cited-findings-5)
    - [Inferences](#inferences-5)
    - [Gaps](#gaps-5)
  - [How does it embed on a static site? Can it load only after a button click? Does it support Spanish and English UI?](#how-does-it-embed-on-a-static-site-can-it-load-only-after-a-button-click-does-it-support-spanish-and-english-ui)
    - [Takeaway](#takeaway-6)
    - [Cited Findings](#cited-findings-6)
    - [Inferences](#inferences-6)
    - [Gaps](#gaps-6)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Self-hosted, open-source comment engines as Disqus replacements (as of 2026-11-05)

Evidence labels. **[P]**: read on the project's or provider's own repo, docs or pricing page. **[S]**: secondary source (blog, directory, search summary). "GitHub API" and "GitLab API" mean live queries run on 2026-11-05 under `gh` or `curl`. Commit counts cover 2025-11-05 to 2026-11-05. Most doc pages were read through a summarising fetch tool, so a "page does not mention X" finding is weaker than a positive finding. Files read directly through the repo API are marked "source".

Pages that could not be read: oracle.com/cloud/free (403), remark42.com/docs/manuals/anti-spam (404, the manual was read from the repo), artalk.js.org ip-region and auth pages (404), waline.js.org login page (404), docs.hetzner.com price-adjustment page in English and German (404), brevo.com/pricing and render.com/pricing (no usable content), the laromierre Remark42 write-up (404), docs.comentario.app domain settings (404).

## What are the latest release date, recent commit activity and open issue state? Is the project a one-person effort?

### Takeaway

Remark42, Waline, Twikoo, Comentario and Isso are all maintained, with a release in 2026. Comentario and Artalk are effectively one-person projects. Remark42, Isso and Waline have at least two active committers. Twikoo has one dominant committer. Cusdis, listed by many "best alternatives" pages, is archived and deprecated.

### Cited Findings

| Engine | Latest release | Previous cadence | Commits, 12 months | Last commit or push | Open issues / PRs | Stars | License | Committers (sample of up to 100 latest commits) |
|---|---|---|---|---|---|---|---|---|
| Remark42 | v1.18.0, 2026-10-11 | v1.17.1 2026-09-14, v1.17.0 2026-09-09 | 266 | 2026-11-02 | 71 / 11 | 5,646 | MIT | paskal 62, umputun 14, Bluetegu 5 |
| Comentario | v3.19.0, 2026-10-16 | v3.18.0 2026-08-14, v3.17.0 2026-03-13, v3.16.0 2026-01-22 | 100+ (query capped) | 2026-11-05 | 25 open of 232 total | 110 (GitLab) | MIT | Dmitry Kann 99, one other 1 |
| Isso | 0.14.0, 2026-03-26 | Previous stable 0.13.0, 2022-06-12 | 97 | 2026-10-25 | 51 / 13 | 5,313 | MIT | jelmer 44, ritzmann 30, pkvach 7, suhindra 4 |
| Waline | @waline/vercel 1.43.4, 2026-09-30 | Monorepo with several packages | 482 | 2026-11-04 | 22 / 32 | 3,158 | GPL-2.0 | lizheming 48, Mister-Hope 25, plus bots |
| Twikoo | 2.0.17, 2026-10-22 | 2.0.16 2026-10-21, 2.0.15 and 2.0.14 2026-10-15, 2.0.13 2026-10-09 | 379 | 2026-11-05 | 24 / 0 | 2,320 | MIT | imaegoo 48, dependabot 35, mercury233 8, Liudon 3 |
| Artalk | v2.10.1, 2026-10-25 | v2.10.0 2026-07-24, previous v2.9.1 2024-09-18 | 87 | 2026-11-03 | 78 / 19 | 2,363 | MIT | qwqcode 67 of 87 |
| Garrul | v2.41.0, 2026-10-31 | Repo created 2026-05-17 | 100+ (query capped) | 2026-11-01 | 4 (issues + PRs) | 57 | Apache-2.0 | KingPin 96, dependabot 3, one other 1 |
| Meh | v0.4.5, 2026-10-21 | Repo created 2025-03-20 | 3 | 2026-10-21 | 3 (issues + PRs) | 63 | MIT | splitbrain 3 of 3 |

- [P] Sources for the table, GitHub API and GitLab API on 2026-11-05: [Remark42](https://github.com/umputun/remark42/releases), [Comentario](https://gitlab.com/comentario/comentario/-/releases), [Isso](https://github.com/isso-comments/isso/releases), [Waline](https://github.com/walinejs/waline/releases), [Twikoo](https://github.com/twikoojs/twikoo/releases), [Artalk](https://github.com/ArtalkJS/Artalk/releases), [Garrul](https://github.com/KingPin/Garrul/releases), [Meh](https://github.com/splitbrain/meh/releases).
- [P] Remark42 v1.18.0 fixes two security bugs: markup on the delete-me approval page could run in the admin's session, and the token in an email unsubscribe link could sign in as that address. [v1.18.0 notes](https://github.com/umputun/remark42/releases/tag/v1.18.0)
- [P] Comentario v3.19.0 adds outbound webhooks and an audit log. v3.18.0 adds Sign in with Apple. [Comentario releases](https://gitlab.com/comentario/comentario/-/releases)

Engines checked and rejected on status, GitHub API on 2026-11-05 unless noted:

- [P] **Cusdis**: repo archived. README says "Cusdis is deprecated now" and asks users to email for data export. Last README commit 2026-07-17, last release v1.3.0 from 2021-11-30. [djyde/cusdis](https://github.com/djyde/cusdis)
- [S] Directory-style search results still present Cusdis as a current option. The search summary did not isolate which page says what. Results included [selfhostyourself](https://selfhostyourself.com/alternative-to/disqus) and [AlternativeTo](https://alternativeto.net/software/disqus/?license=free).
- [P] **Commento**: last push 2022-11-25, no releases. [adtac/commento](https://github.com/adtac/commento)
- [P] **Commento++**: last push 2023-06-27, last release 2022-04-07. [souramoo/commentoplusplus](https://github.com/souramoo/commentoplusplus)
- [P] **Schnack**: last push 2023-03-03, last release 2020-05-24. [schn4ck/schnack](https://github.com/schn4ck/schnack)
- [S] Schnack does not allow anonymous comments, per a vendor article. [OOPSpam](https://www.oopspam.com/blog/open-source-comment-systems-their-anti-spam-capabilities)
- [P] **HashOver**: last push 2022-11-19. [jacobwb/hashover-next](https://github.com/jacobwb/hashover-next)
- [P] **Staticman**: last push 2024-04-24. [eduardoboucas/staticman](https://github.com/eduardoboucas/staticman)
- [P] **Cactus Comments** (Matrix based): client activity 2025-09-30, appservice activity 2024-08-11. [GitLab](https://gitlab.com/cactus-comments)
- [P] **Coral**: active, v9.11.8 on 2026-07-07, 91 commits. [coralproject/talk](https://github.com/coralproject/talk/releases)
- [S] Coral is described as aimed at newsrooms, per a search summary with no single page isolated. [selfhostyourself results](https://selfhostyourself.com/alternative-to/disqus)
- [P] **Chirpy**: last push 2026-11-05, last GitHub release 2024-10-30. Not evaluated further. [devrsi0n/chirpy](https://github.com/devrsi0n/chirpy)
- [S] **giscus, utterances, Gitalk**: giscus uses GitHub Discussions as its backend, and the other two are GitHub-backed by the same design. They fail the hard requirement of no GitHub account. The giscus statement comes from a search summary, with no single page isolated. [giscus repo](https://github.com/giscus/giscus), [utterances repo](https://github.com/utterance/utterances), [Gitalk repo](https://github.com/gitalk/gitalk)

### Inferences

- Garrul's 1,425 commits and v2.41.0 in under six months, plus AGENTS.md and CLAUDE.md in the repo, suggest heavy AI-assisted development. That is high velocity with little production history.
- Artalk's 22-month release gap (2024-09 to 2026-07) and Isso's almost 4-year gap (2022-06 to 2026-03) show maintainers can go quiet. Both have resumed.
- Twikoo released five versions in two weeks of October 2026. That helps with fixes and raises the upgrade rate.

### Gaps

- Issue response times were not measured.
- Commit counts include bot commits. Waline and Comentario totals are understated or capped in places.
- Remarq, ziscus, comment-kit and StaticLayer surfaced only in a [search summary](https://remarq.pages.dev/) and were not verified.

## Can visitors comment as guests with no account? What must they provide? Which logins are supported?

### Takeaway

Remark42 (when enabled), Comentario, Isso, Waline, Twikoo and Garrul all support guests with no account and no GitHub. Isso and Twikoo have no visitor login at all. Remark42 requires a name but no email. Comentario can accept a fully anonymous comment.

### Cited Findings

- [P] **Remark42**: `AUTH_ANON` defaults to `false`. The docs state OAuth2 is not required with email or anonymous login. [Parameters](https://remark42.com/docs/configuration/parameters/)
- [P] **Remark42**: an anonymous name must be at least three characters, using letters, numbers, underscores and spaces. [Authorization docs, source](https://github.com/umputun/remark42/blob/master/site/content/docs/configuration/authorization/index.md)
- [P] **Remark42** logins: Google, Facebook, Microsoft, GitHub, Apple, Yandex, Patreon, Discord, Telegram, custom OAuth2, email. [README](https://github.com/umputun/remark42)
- [P] **Comentario**: commenting without registration is optional per domain. Logins: local email and password, Google, Twitter/X, Facebook, GitHub, GitLab, Apple, SSO. [Features](https://docs.comentario.app/en/about/features/)
- [S, summary of primary doc] **Comentario**: the name is optional by default, and an empty name is attributed to Anonymous. A setting makes it required. [Dynamic setting](https://docs.comentario.app/en/configuration/backend/dynamic/domain.defaults.login.unregistered.requirename/)
- [S, summary of primary doc] **Comentario**: a setting skips the login dialog for unauthenticated users. [Dynamic setting](https://docs.comentario.app/en/configuration/backend/dynamic/domain.defaults.login.showforunauth/)
- [P] **Isso**: `require-author` and `require-email` both default to `false`, with no validation. No login provider appears in the server config. [Server config](https://isso-comments.de/docs/reference/server-config/)
- [P] **Waline**: `meta` defaults to `['nick','mail','link']`, `requiredMeta` defaults to `[]`, and `login` accepts `enable` (default), `disable` or `force`. [Client props](https://waline.js.org/en/reference/client/props.html)
- [P] **Twikoo**: nickname, email and website are each configurable as required or optional. Password login is described for the admin panel only. [README.en](https://github.com/twikoojs/twikoo/blob/main/README.en.md)
- [P] **Artalk**: `auth.enabled` (social login) defaults to `false`. `auth.anonymous` defaults to `false` and is described as "Allow skipping verification, only fill in an anonymous nickname". Providers in the sample config include email, GitHub, GitLab and Gitea. [artalk.example.yml, source](https://github.com/ArtalkJS/Artalk/blob/master/conf/artalk.example.yml)
- [P] **Garrul**: anonymous posting gated by Turnstile and rate limits, or OAuth with GitHub, Google, Facebook, X, Discord. [README](https://github.com/KingPin/Garrul)
- [P] **Meh**: ships a `<meh-login>` component. The README does not state whether guests can post. [README](https://github.com/splitbrain/meh)

### Inferences

- Artalk's UI strings ("Please fill in your name and email to upload") suggest name and email by default. [en.ts](https://github.com/ArtalkJS/Artalk/blob/master/ui/artalk/src/i18n/en.ts) This is not a documented statement.
- All of these keep GitHub optional. An owner should simply leave GitHub login unconfigured.
- Waline's Vercel guide asks the owner, not visitors, to sign in with GitHub to deploy. The owner already has a GitHub account.

### Gaps

- Waline's list of social providers was not confirmed (page 404).
- Whether Meh guests can post was not confirmed.
- Whether Comentario's unregistered commenting is on by default was not confirmed.

## What does it need to run? What is the monthly hosting cost, what are the free tier limits, and how much maintenance does it take?

### Takeaway

Real free options exist only for the serverless engines: Waline on Vercel plus Neon, and Twikoo or Garrul on Cloudflare Workers plus D1. Server-process engines (Remark42, Comentario, Isso, Artalk, Meh) cost about US$2.34/month on Fly.io or about US$4.54/month on OVH. Oracle's free tier exists but its idle rule fits a comment server badly. Hetzner's cheap plans rose sharply during 2026 and were reported unavailable to order.

### Cited Findings

Engine runtime:

- [P] **Remark42**: Go binary or Docker, embedded single-file store (`STORE_TYPE` default `bolt`). [Parameters](https://remark42.com/docs/configuration/parameters/), [README](https://github.com/umputun/remark42)
- [P] **Remark42**: about 80 MiB RAM, CPU under 0.1%, under 200 MB disk after five years, by the project's own figures. [Installation](https://remark42.com/docs/getting-started/installation/)
- [S] **Remark42**: a Railway template lists 128 MB minimum RAM and 512 MB recommended. [Railway](https://railway.com/deploy/remark42)
- [P] **Remark42**: "Integration with automatic SSL (direct or via reproxy)". [Home page, source](https://github.com/umputun/remark42/blob/master/site/content/_index.md)
- [P] **Comentario**: server plus database. PostgreSQL 10 to 18, or SQLite, "probably fine... as a minimal option", for "up to a few thousand comments". [Requirements](https://docs.comentario.app/en/installation/requirements/)
- [P] **Comentario**: the hosted cloud is "currently not available". The docs list Cloudron and an unofficial Railway template. [Cloud versions](https://docs.comentario.app/en/getting-started/cloud/)
- [P] **Isso**: Python HTTP server with a local `dbpath` file, placed behind a reverse proxy. It should not be exposed on a public interface. No server-side TLS option is documented. [Quickstart](https://isso-comments.de/docs/guides/quickstart/), [Server config](https://isso-comments.de/docs/reference/server-config/)
- [P] **Isso**: the repo has a Dockerfile and a Docker section in the README. [Repo](https://github.com/isso-comments/isso)
- [P] **Waline**: Vercel functions plus Neon in the official guide. Databases: MongoDB, MySQL, TiDB, PostgreSQL, SQLite, GitHub (CSV, "not recommended"), custom. [Vercel guide](https://waline.js.org/en/guide/deploy/vercel.html), [Database](https://waline.js.org/en/guide/database.html)
- [P] **Waline**: deploy guides for Vercel, Netlify, Railway, TiDB, Zeabur, Aliyun and VPS/Docker (`lizheming/waline`). No Cloudflare guide in the docs tree. [Docs tree](https://github.com/walinejs/waline/tree/main/docs/src/en/guide/deploy)
- [P] **Waline**: the first registered user becomes admin. [Vercel guide](https://waline.js.org/en/guide/deploy/vercel.html)
- [P] **Twikoo**: deploys on CloudBase, Vercel, Netlify, Hugging Face, Railway, Cloudflare Workers, AWS Lambda, EdgeOne, Docker. [README.en](https://github.com/twikoojs/twikoo/blob/main/README.en.md)
- [P] **Twikoo on Cloudflare**: database is D1 or MongoDB. D1 mode is reported working, and MongoDB mode and R2 upload are not yet verified. Direct SMTP does not work, so HTTP channels (SendGrid, MailChannels, Resend) are required. Akismet and Tencent content moderation are not supported. The build needs Node.js 26 and pnpm. [docs/backend.md, Chinese, source](https://github.com/twikoojs/twikoo/blob/main/docs/backend.md)
- [P] The English Twikoo backend page does not mention Cloudflare at all, which conflicts with README.en and the Chinese docs. [English backend page](https://twikoo.js.org/en/backend.html)
- [P] **Twikoo on other serverless hosts**: needs MongoDB Atlas. The doc suggests us-west-2 as a default region. [MongoDB Atlas guide](https://twikoo.js.org/en/mongodb-atlas.html)
- [P] **Artalk**: Go server. SQLite, MySQL, PostgreSQL, SQL Server. [config](https://artalk.js.org/guide/backend/config.html)
- [P] **Garrul**: one Cloudflare Worker per site with D1, KV and Turnstile. No server or container. The project says "free plan is fine for small operators". [README](https://github.com/KingPin/Garrul)
- [P] **Meh**: PHP plus SQLite, one database per site, with a Docker container. [Author's post](https://www.splitbrain.org/blog/2025-03/26-meh_another_comment_system)

Hosting providers, read 2026-11-05:

| Provider | Exists? | Limits or price | Fit for this blog |
|---|---|---|---|
| Vercel Hobby | Yes, free | 1M invocations, 4 CPU-hours Active CPU, 360 GB-hours memory, 100 GB transfer. Non-commercial only. Over limit: usually wait 30 days. 1 function region, default `iad1` (USA) ([Hobby](https://vercel.com/docs/plans/hobby), [Regions](https://vercel.com/docs/functions/configuring-functions/region)) | Fits Waline and Twikoo. Move the region to the EU |
| Cloudflare Workers Free | Yes, free | 100,000 requests/day, 10 ms CPU per invocation, KV 1,000 writes/day. Paid minimum US$5/month ([Workers pricing](https://developers.cloudflare.com/workers/platform/pricing/)) | Fits Twikoo and Garrul |
| Cloudflare D1 Free | Yes, free | 5M rows read/day, 100,000 written/day, 5 GB, 10 databases ([D1 pricing](https://developers.cloudflare.com/d1/platform/pricing/)) | Far above need |
| Neon Free | Yes, free, no card | 1 GB per project, 100 CU-hours, 5 GB egress. Suspends after 5 min, restarts in a few hundred ms ([Neon pricing](https://neon.com/pricing)) | Fits Waline |
| Supabase Free | Yes, free | 500 MB, 5 GB egress, 2 active projects. "Paused after 1 week of inactivity". Pro from US$25 ([Supabase pricing](https://supabase.com/pricing)) | Poor: pause rule on a quiet blog |
| Turso Free | Yes, free | 100 databases, 5 GB, 500M reads and 10M writes/month. Developer US$4.99 ([Turso pricing](https://turso.tech/pricing)) | None of the engines read documents Turso or libSQL support |
| MongoDB Atlas M0 | Yes, free | 512 MB, 100 ops/s, 500 connections. Pauses after 30 days with zero connections ([Pricing](https://www.mongodb.com/pricing), [Limits](https://www.mongodb.com/docs/atlas/reference/free-shared-limitations/)) | Fits Twikoo or Waline if traffic is non-zero monthly |
| Fly.io | No free tier for new organizations. US$1 trial for 7 days | shared-cpu-1x 256 MB US$2.19/month, volume US$0.15/GB/month, shared IPv4 free, first 10 certificates free. Card required after trial ([Fly pricing](https://docs.fly.io/about/pricing)) | Cheapest paid fit for Remark42 |
| Oracle Always Free | Yes | 2 AMD micro VMs, A1 up to 2 OCPU and 12 GB, 200 GB block storage, home region only. Idle reclaim rule. "Out of host capacity" errors ([Oracle docs](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm)) | Risky, see below |
| Hetzner Cloud | Listed, availability in doubt | From €5.99 Cost-Optimized and €6.49 Regular, excl. VAT. Shared-resources section marked "Currently not available" ([Hetzner](https://www.hetzner.com/cloud/)) | Check before planning on it |
| OVHcloud VPS-1 | Yes | From US$4.54/month, 2 vCores, 4 GB, 40 GB, unlimited traffic ([OVHcloud](https://www.ovhcloud.com/en/vps/)) | Fits all server engines |
| netcup VPS 500 G12.5 | Yes | €8.26 net/month on 12 months, 2 vCores, 4 GB, 64 GB. Vienna, Nuremberg, Amsterdam ([netcup](https://www.netcup.com/en/server/vps)) | Fits, not cheapest |
| Railway | Yes | Free US$0 with US$1/month usage credits. Hobby US$5/month with US$5 usage ([Railway pricing](https://railway.com/pricing)) | Templates exist for Remark42 and Waline. Free credit may not cover an always-on process |
| PikaPods | Yes | No comment engine in catalog ([PikaPods apps](https://www.pikapods.com/apps)) | Does not apply |

More hosting detail:

- [P] Oracle idle rule: an instance is idle if over 7 days the 95th percentile CPU is under 20%, network is under 20%, and on A1 memory is under 20%. Idle Always Free instances "may be reclaimed". [Oracle docs](https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm)
- [S] Hetzner price path: CX23 €2.99 to €3.99 on 2026-04-01 ([Tom's Hardware](https://www.tomshardware.com/tech-industry/hetzner-to-raise-prices-by-up-to-37-percent-from-april-1)), then €3.99 to €5.49 on 2026-06-15 for new orders, CAX11 €4.49 to €5.99 ([wz-it](https://wz-it.com/en/blog/hetzner-price-increase-june-2026-cpx-ccx-alternatives/)).
- [S] Hetzner availability: all Cost-Optimized plans showed a disabled Create button on 2026-09-02, 09-08, 10-13 and 10-20. Capacity notice since about 2026-06-26. IPv4 adds €0.50/month. [Bitdoze, 2026-10-20](https://www.bitdoze.com/es/hetzner-cloud-precios-2026/)

Maintenance:

- [P] Remark42 makes daily backups by default, keeping 10. They sit on the same volume unless copied off. [Backup docs, source](https://github.com/umputun/remark42/blob/master/site/content/docs/backup/backup/index.md)
- [P] Isso SMTP passwords are stored in plain text in the config file. [Server config](https://isso-comments.de/docs/reference/server-config/)
- [P] Atlas backups conflict: the pricing page says they are not available on the free tier, and the limits doc says a daily snapshot is kept, up to four. [Pricing](https://www.mongodb.com/pricing), [Limits](https://www.mongodb.com/docs/atlas/reference/free-shared-limitations/)

Estimated realistic monthly cost, excl. VAT:

| Engine | Cheapest realistic stack | Cost |
|---|---|---|
| Waline | Vercel Hobby + Neon Free (EU regions) | US$0 |
| Twikoo | Vercel + Atlas M0, or Cloudflare Workers + D1 Free | US$0 if within free limits (Cloudflare fit untested, else US$5) |
| Garrul | Cloudflare Workers + D1 + KV + Turnstile Free | US$0 per project's claim (untested, else US$5) |
| Remark42 | Fly.io 256 MB + 1 GB volume | about US$2.34 |
| Comentario | Fly.io with SQLite if 256 MB suffices, else OVH VPS-1 | about US$2.34 to 4.54 |
| Isso, Artalk, Meh | Fly.io or OVH VPS-1 | about US$2.34 to 4.54 |

### Inferences

- Fly.io US$2.34 is my calculation (2.19 + 0.15), assuming a 1 GB volume and no dedicated IPv4.
- A comment server on a zero-comment blog will meet Oracle's idle definition, since 80 MiB of RAM on a 12 GB allocation and near-zero CPU fall far below 20%. Free does not mean durable here. Off-host backups would be mandatory.
- Serverless stacks remove OS patching, TLS and process supervision. They keep dependency upgrades, account risk and provider-limit changes.
- Server-process engines need the owner to patch on a schedule. Remark42's October 2026 security release shows this is not theoretical.
- Remark42, Isso, Comentario and Artalk need a running process and local files or a database connection. None documents a Workers or Vercel deployment in the pages read.
- A personal blog without commerce should fit Vercel's non-commercial rule. Ads, sponsorships or paid products on the blog could break it.

### Gaps

- Comentario's memory use was not found. Whether 256 MB is enough is untested.
- One search result claimed Comentario has a commercial hosted option. The project's docs say hosted cloud is not available. The page behind the claim was not identified, so it is unverified.
- Waline and Twikoo CPU use on Vercel Hobby was not measured. 4 CPU-hours should far exceed a low-traffic blog's needs, but I have no measured data.
- Whether Garrul or Twikoo stay within 10 ms CPU per invocation on the free plan is not tested. Twikoo's jsdom-based sanitising makes this worth testing. Twikoo's Cloudflare docs make no statement on free or paid plans. If the free plan fails, the cost is the US$5/month Workers Paid minimum.
- Render's free tier could not be read.
- OVH EU locations and commitment terms were not stated on the page read.
- Whether Oracle allows Madrid as a home region was not checked. oracle.com/cloud/free returned 403.
- Whether an Oracle Pay As You Go upgrade removes reclamation risk was not confirmed from Oracle's page.

## How is spam handled? How does moderation work, is there pre-approval, and how does the owner get notified?

### Takeaway

Remark42 is the weak point here: no pre-approval setting, captcha or content spam filter is documented or found in its code, only a honeypot and a later cleanup command. Comentario, Waline, Artalk, Garrul, Isso, Twikoo and Meh all offer a moderation queue. Akismet is available in Comentario, Waline, Artalk, Garrul, and Twikoo except on Cloudflare. All email goes through an SMTP account or provider the owner supplies.

### Cited Findings

- [P] **Remark42**: bot protection is a hidden form field checked at login. "More sophisticated mechanism is discussed in the issue #754 but not yet implemented." A `cleanup` command scores comments on bad words, bad users, links and zero votes. [Spam manual, source](https://github.com/umputun/remark42/blob/master/site/content/docs/manuals/spam/index.md)
- [P] **Remark42**: GitHub code search on 2026-11-05 returned 0 hits for `premod`, `captcha`, `turnstile` and `cleantalk`. Hits for `pending` and `approve` were tests, JSON store, the WordPress migrator and the delete-me flow, judged by file path only. [Repo](https://github.com/umputun/remark42)
- [P] **Remark42**: `RESTRICTED_WORDS`, `RESTRICTED_NAMES`, `MIN_COMMENT_SIZE`, `MAX_COMMENT_SIZE`. `NOTIFY_ADMINS` accepts `telegram`, `slack`, `webhook`, `email`. Email uses generic SMTP settings. [Parameters](https://remark42.com/docs/configuration/parameters/), [Email docs, source](https://github.com/umputun/remark42/blob/master/site/content/docs/configuration/email/index.md)
- [P] **Remark42** admin UI: delete comments, block users, disable comments per post. [Admin interface, source](https://github.com/umputun/remark42/blob/master/site/content/docs/manuals/admin-interface/index.md)
- [P] **Comentario**: per-domain rules flag comments for review by registered status, approved comment count, account age and whether the comment contains a link. Moderators can be notified about pending or all comments. [Features](https://docs.comentario.app/en/about/features/)
- [P] **Comentario**: spam extensions are Akismet, APILayer SpamChecker and Perspective, configured per domain. [Features](https://docs.comentario.app/en/about/features/)
- [P] **Isso**: `[moderation] enabled` default `false`, unprocessed items purged after `30d` by default. `[guard]` rate limit 2/minute per /24 or /48. `notify` accepts `stdout`, `smtp`, `webhook`. The stdout backend is noted as broken. [Server config](https://isso-comments.de/docs/reference/server-config/)
- [S] **Isso**: "no content or IP analysis". The source sells an anti-spam API, article updated 2024-07-26. [OOPSpam](https://www.oopspam.com/blog/open-source-comment-systems-their-anti-spam-capabilities)
- [P] **Waline**: `COMMENT_AUDIT` default `false`. `AKISMET_KEY` default `70542d86693e`, set `false` to disable. `TURNSTILE_*`, `RECAPTCHA_V3_*`, `IPQPS` default 60 seconds. `SMTP_*` and `WEBHOOK`. [Server env](https://waline.js.org/en/reference/server/env.html)
- [P] **Twikoo**: Akismet or Tencent content security, manual review mode, per-IP limit per 10 minutes. Notifications by email, plus Telegram, Discord and others through pushoo. [README.en](https://github.com/twikoojs/twikoo/blob/main/README.en.md)
- [P] **Twikoo on Cloudflare**: no Akismet or Tencent checks. AI detection is available through `@xsai/generate-text`. [docs/backend.md, source](https://github.com/twikoojs/twikoo/blob/main/docs/backend.md)
- [P] **Artalk**: `moderator.pending_default` default `false`. `akismet_key`, Tencent, Aliyun, keyword filter. [Example config, source](https://github.com/ArtalkJS/Artalk/blob/master/conf/artalk.example.yml), [Moderator docs](https://artalk.js.org/guide/backend/moderator.html)
- [P] **Artalk** captcha: `image` in the sample config, also Turnstile, reCAPTCHA v3, hCaptcha, GeeTest and self-hosted Cap. Sample limits 3 actions per 60 s. [Captcha docs](https://artalk.js.org/guide/backend/captcha.html)
- [P] **Artalk** email: `smtp`, `ali_dm`, `sendmail`. Separate `admin_notify` section. [Email docs](https://artalk.js.org/guide/backend/email.html)
- [P] **Garrul**: Turnstile, rate limit, sanitizer and honeypot always on. Optional heuristics plus Akismet, Workers AI or a custom classifier send suspicious comments to a queue. Reply notifications use Resend with your own key. Moderator digest is optional and off by default. [README](https://github.com/KingPin/Garrul)
- [P] **Meh**: new comments are Pending by default for most cases, with flood control. SMTP notifications state whether approval is needed. [Moderation](https://github.com/splitbrain/meh/blob/main/doc/moderation.md), [SMTP](https://github.com/splitbrain/meh/blob/main/doc/smtp.md)

Provider limits:

- [P] Resend Free: 3,000 emails/month, 100/day, 3 custom domains. [Resend](https://resend.com/pricing)
- [S] Brevo Free: 300 emails/day with SMTP and API, "Powered by Brevo" badge. Official page unreadable, and paid prices conflict across sources. From a search summary of 2026 reviews, with no single page isolated. Results included [costbench](https://costbench.com/software/marketing-automation/brevo/free-plan) and [dreamlit](https://dreamlit.ai/blog/brevo-review).
- [P] Akismet: Personal is pay-what-you-want for personal sites and blogs. Pro costs €9.95/month with 500 checks for one commercial site. [Akismet](https://akismet.com/pricing/)
- [P] Cloudflare Turnstile Free: unlimited challenges, up to 20 widgets. [Turnstile plans](https://developers.cloudflare.com/turnstile/plans/)

### Inferences

- Pre-approval is off by default in Isso, Waline and Artalk. An owner who wants it must set it during setup.
- Guests with name only on Remark42 means spam appears publicly until the owner deletes it. For a low-maintenance owner, this is the main argument against Remark42 even though its other properties are strong.
- With near-zero expected comments, pre-approval plus an email notice covers most of the workload. Paid spam filtering is likely unnecessary at first.

### Gaps

- I found no first-hand spam volume reports for any engine on a small blog. The Waline search returned setup posts only.
- Twikoo's Turnstile or captcha support is not listed in README.en or the English config headings. The English config page is itself marked deprecated.
- Comentario's email transport was not read. The moderator and reply notifications are documented, but the SMTP or provider configuration page was not.
- Whether self-hosted engines receive less spam than Disqus is unmeasured. One search-summarised page asserted it as opinion.

## Can comments be exported or backed up? Can Disqus data be imported?

### Takeaway

All main engines import Disqus. Exports are documented for Remark42, Comentario, Artalk and Garrul. For Waline, Twikoo and Isso I found no export statement in the pages read, though database dumps remain possible.

### Cited Findings

- [P] **Remark42**: `import -p disqus`. Requires `ADMIN_PASSWD`. **All import methods remove existing comments on the site.** Import assumes the file's domain with `https://`. [Migration](https://remark42.com/docs/backup/migration/)
- [P] **Remark42**: daily gzipped backups, JSON export. [Backup, source](https://github.com/umputun/remark42/blob/master/site/content/docs/backup/backup/index.md)
- [P] **Comentario**: imports Disqus, WordPress, Commento and Commento++. Exports JSON. [Features](https://docs.comentario.app/en/about/features/)
- [P] **Isso**: `isso import -t disqus disqus.xml`, optional `--thread-id`. Disqus votes are not exported. [Quickstart](https://isso-comments.de/docs/guides/quickstart/)
- [P] **Waline**: migration tool converts from Valine, Disqus, Twikoo, Artalk, Commento. [Migration tool](https://waline.js.org/en/migration/tool.html)
- [P] **Twikoo**: imports Valine, Artalk, Disqus. [README.en](https://github.com/twikoojs/twikoo/blob/main/README.en.md)
- [P] **Artalk**: Disqus XML converted to Artrans, then imported. Exports via dashboard or `artalk export ./artrans`. [Transfer](https://artalk.js.org/guide/transfer.html)
- [P] **Garrul**: imports Disqus, Remark42, Comentario, Isso, Cusdis with dry run. Exports JSON, CSV and `.sql`. [README](https://github.com/KingPin/Garrul)
- [P] **Meh**: Disqus XML import through a CLI. [Author's post](https://www.splitbrain.org/blog/2025-03/26-meh_another_comment_system), [Doc](https://github.com/splitbrain/meh/blob/main/doc/disqus.md)

### Inferences

- The blog has zero real comments, so Disqus import barely matters. Export and portability matter more, as they set the cost of leaving an engine later.
- Isso's SQLite file and Waline's Neon database can be dumped with standard tools. This is the fallback where no product export is documented.
- Waline, Artalk and Garrul can import one or more of the other engines, which lowers lock-in between them.

### Gaps

- Waline export: the migration page does not say how to export. An admin UI export may exist, unconfirmed.
- Twikoo export: not confirmed on the English pages read.
- Disqus import quality was not tested for any engine. The blog's export would contain little to test.

## What tracking, cookies and third-party requests does the embed cause? Can it be hosted in the EU?

### Takeaway

Remark42, Comentario, Isso and Garrul make the strongest documented privacy claims. Waline's defaults contact several third parties (Akismet, unpkg, Libravatar, a default OAuth service) and need deliberate configuration. All can be placed in EU regions, but US-owned platforms remain US-owned.

### Cited Findings

- [P] **Remark42**: its docs state no tracking of any sort and "no third-party analytic services". JWT in an HttpOnly cookie plus an XSRF cookie, no cross-site login, avatars proxied. [Home page, source](https://github.com/umputun/remark42/blob/master/site/content/_index.md)
- [P] **Comentario**: "adds no tracking scripts or pixels, and shows no ads". IP collection is off by default. Depersonalised stats on country, language, OS, browser, device are collected. Gravatar is supported. [Features](https://docs.comentario.app/en/about/features/)
- [P] **Comentario** docs carry a privacy policy naming Google Analytics, AdSense and hosting on Netlify, Cloudflare and Scaleway. It defines a "Service" offered through the Comentario website. [Privacy policy](https://docs.comentario.app/en/legal/privacy/)
- [P] **Isso**: stores IPs anonymised to /24 or /48. `gravatar` default `false`. A `samesite` cookie option exists. [utils source](https://github.com/isso-comments/isso/blob/master/isso/utils/__init__.py), [Server config](https://isso-comments.de/docs/reference/server-config/)
- [P] **Waline**: `AKISMET_KEY` has a built-in default. `GRAVATAR_STR` defaults to `https://seccdn.libravatar.org/avatar/{{mail|md5}}`. `OAUTH_URL` defaults to `https://oauth.lithub.cc`, self-hostable. [env.md, source](https://github.com/walinejs/waline/blob/main/docs/src/en/reference/server/env.md)
- [P] **Waline**: default emoji from `//unpkg.com/@waline/emojis@1.1.0/weibo`. The guide loads the client from unpkg. `DISABLE_USERAGENT` and `DISABLE_REGION` default to `false`, so user agent and region are displayed. [Client props](https://waline.js.org/en/reference/client/props.html), [Vercel guide](https://waline.js.org/en/guide/deploy/vercel.html), [Server env](https://waline.js.org/en/reference/server/env.html)
- [P] **Artalk**: `gravatar.mirror` default `https://www.gravatar.com/avatar/`. [Frontend config, source](https://github.com/ArtalkJS/Artalk/blob/master/docs/docs/en/guide/frontend/config.md)
- [P] **Twikoo**: states sensitive fields such as email and IP are protected through cloud functions. [README.en](https://github.com/twikoojs/twikoo/blob/main/README.en.md)
- [P] **Garrul**: "No analytics, no tracking pixels, no advertising, no Gravatar. One strictly-necessary cookie." Stores HMAC-hashed IPs and user agents. Per-user JSON export and erase. Compliance templates ship in the repo, which notes you are the controller and "it does not claim Garrul 'is GDPR compliant'". [README](https://github.com/KingPin/Garrul)

EU placement:

- [P] Neon: AWS Frankfurt and London. [Neon regions](https://neon.com/docs/introduction/regions)
- [P] D1: `--jurisdiction=eu`, set only at creation and not changeable after. [D1 data location](https://developers.cloudflare.com/d1/configuration/data-location/)
- [P] Vercel: region is selectable, default `iad1`. Hobby gets one region. [Vercel regions](https://vercel.com/docs/functions/configuring-functions/region)
- [P] Hetzner: Falkenstein, Nuremberg, Helsinki. [Hetzner](https://www.hetzner.com/cloud/)
- [P] netcup: Vienna, Nuremberg, Amsterdam. [netcup](https://www.netcup.com/en/server/vps)

### Inferences

- Comentario's privacy policy appears to cover the project's own website and planned service, not a self-hosted instance. The owner should write their own policy and not copy it. This reading comes from the policy's scope wording and is not stated explicitly.
- Turnstile requires loading a Cloudflare script in the visitor's browser. Any engine using it adds a third party, Garrul included, whose anti-spam design requires it for guests.
- Gravatar and Libravatar send a hash of the email to a third party. Waline's Libravatar default should be reviewed, or replaced by a self-controlled option.
- Akismet sends comment content to a third party. On Waline it is on by default, so a GDPR-minded setup should either set `AKISMET_KEY=false` or disclose it.
- An EU database region does not change that Vercel, Cloudflare and Neon are US companies. The EU-only option is a server engine on an EU provider. Click-to-load helps here because no third-party request or cookie occurs before the visitor acts. Legal assessment remains with the owner.

### Gaps

- I did not capture network traces for any embed. Findings rely on docs and source.
- Twikoo's default CDN and avatar source were not confirmed.
- Isso's and Comentario's cookies for guests were not confirmed in docs.
- Artalk's IP-region default was not confirmed (docs page 404, and the key is not in the sample config top level).
- No DPA or transfer documents were read for any provider.

## How does it embed on a static site? Can it load only after a button click? Does it support Spanish and English UI?

### Takeaway

All engines embed through a script tag plus a container, so all fit the blog's click-to-load button. Spanish is present in Remark42, Comentario, Isso, Waline, Garrul and Meh. Twikoo and Artalk have no Spanish UI in their source trees, which is a strong negative for a bilingual blog.

### Cited Findings

| Engine | Embed | Click-to-load mechanism | Spanish |
|---|---|---|---|
| Remark42 | `remark_config` plus script plus `<div id="remark42">` ([Frontend docs](https://remark42.com/docs/configuration/frontend/)) | Official snippet injects `<script>` from JS. SPA API with instance create and destroy ([spa.md](https://github.com/umputun/remark42/blob/master/site/content/docs/configuration/frontend/spa.md)) | Yes, `es`, in the docs list ([Frontend docs](https://remark42.com/docs/configuration/frontend/)) |
| Comentario | `<script defer src=".../comentario.js">` plus `<comentario-comments>` ([Embedding](https://docs.comentario.app/en/configuration/embedding/)) | `auto-init` attribute (default `true`). Attributes are reactive ([Comments tag](https://docs.comentario.app/en/configuration/embedding/comments-tag/)) | `es.yaml` in `resources/i18n` ([GitLab API](https://gitlab.com/comentario/comentario/-/tree/dev/resources/i18n)). `lang` default is page language or `en` |
| Isso | `<script data-isso=... src=".../js/embed.min.js">` plus `<section id="isso-thread">`. `data-isso` is needed with `async` ([Quickstart](https://isso-comments.de/docs/guides/quickstart/)) | `window.Isso = { init, fetchComments }` ([embed.js](https://github.com/isso-comments/isso/blob/master/isso/js/embed.js)) | Yes, `es` ([i18n.js](https://github.com/isso-comments/isso/blob/master/isso/js/app/i18n.js)). `data-isso-lang` default follows browser |
| Waline | CSS plus JS, then `init({el, serverURL})` ([Vercel guide](https://waline.js.org/en/guide/deploy/vercel.html)) | Call `init()` on click | Yes, `es`, `es-MX` ([i18n](https://waline.js.org/en/guide/features/i18n.html)). `lang` default `navigator.language` |
| Twikoo | Client script, see docs | Not confirmed in pages read | No. Locales: en, id-ID, ja-JP, ko-KR, uz-UZ, vi-VN, zh-CN, zh-HK, zh-TW ([locales](https://github.com/twikoojs/twikoo/tree/main/packages/client/src/i18n/locales)) |
| Artalk | `Artalk.init()` ([i18n docs](https://artalk.js.org/guide/frontend/i18n.html)) | Call `init()` on click | No. en, zh-CN, zh-TW, ja, ko, fr, ru, tr, pt-PT. Custom strings can be passed as an object ([i18n docs](https://artalk.js.org/guide/frontend/i18n.html)) |
| Garrul | `div` with data attributes plus `embed.js`, Shadow DOM, max 30 KB gzipped, iframe option ([README](https://github.com/KingPin/Garrul)) | Not stated. Dynamic script insertion likely | `src/i18n/es.ts` exists ([Repo](https://github.com/KingPin/Garrul/tree/main/src/i18n)) |
| Meh | Web components through a script tag ([README](https://github.com/splitbrain/meh)) | Not stated | `*.es.json` exists ([Repo](https://github.com/splitbrain/meh/tree/main/frontend/src/components/meh-comments/i18n)) |

- [P] Artalk docs conflict on the default locale: config page says `zh-CN`, i18n page says en-US. [config](https://artalk.js.org/guide/backend/config.html), [i18n](https://artalk.js.org/guide/frontend/i18n.html)
- [P] Remark42 open issue from 2026-08-22: "`remark_config.node` is documented but ignored". Keep the standard `remark42` element id. [Issues](https://github.com/umputun/remark42/issues)
- [P] Remark42 v1.18.0: the reply placeholder is new, and "Other locales keep their comment placeholder until translated". Spanish may have partial gaps. [v1.18.0 notes](https://github.com/umputun/remark42/releases/tag/v1.18.0)
- [S] An Isso user who left Disqus chose Isso over Remark42 and later wrote he would probably pick Remark42 for its features. The apt version was too old, so he installed through pip. [Frozen Fractal, 2023-11-20](https://frozenfractal.com/blog/2023/11/20/bye-bye-disqus)
- [S] One Isso user called setup "a bit of a pain" due to vague docs, and another said install was easy. Both come from a search summary of personal blogs that did not attribute each quote. Results included [researchut.com](https://researchut.com/blog/Comments_on_Hugo_with_Isso/), [cpbotha.net](https://cpbotha.net/2019/11/10/we-now-have-self-hosted-isso-comments/) and [dennogumi.org](https://dennogumi.org/2015/06/isso-for-comments/).

### Inferences

- The blog has a custom comment provider at `_includes/comments-providers/custom.html`. Each engine's script can be injected from the existing button handler. No engine documents this exact pattern, but every embed reduces to adding a script and calling or awaiting init.
- A bilingual blog can set the language per post from Jekyll front matter, passing `locale` or `lang` to the embed. Engines that default to the browser language (Isso, Waline) would otherwise show the visitor's language, which is also acceptable.
- Ranking for this owner, based on the evidence above:
  1. **Waline + Vercel + Neon Frankfurt**: US$0, guests, Spanish, pre-approval through `COMMENT_AUDIT`, optional Akismet. Needs third-party defaults changed, and sits on US platforms.
  2. **Comentario on a small EU host**: guests, Spanish, rule-based pre-approval, no tracking, optional Akismet. About US$2.34 to 4.54/month plus patching. Effectively one maintainer.
  3. **Garrul + Cloudflare**: US$0 if free limits hold, guests, Spanish, queue and GDPR paperwork. Under six months old with one maintainer, so highest project risk.
  4. **Isso**: simple guests and pre-approval, but no spam filter beyond rate limits, plus a Python server to maintain.
  5. **Remark42**: best-documented privacy and mature, but no documented pre-approval or captcha, which matters most with open guest access. Move it up if the owner accepts login by email.
  6. **Twikoo and Artalk**: no Spanish UI. Twikoo on Cloudflare also loses Akismet.
- Pushback for the owner: with zero real comments so far, any engine adds a service for little use. A serverless stack at US$0 limits the waste, and any server-based stack adds recurring patch work that the comment volume does not justify.

### Gaps

- No engine was deployed or tested. Click-to-load is inferred from embed design except where cited.
- Completeness of Spanish translations was not checked. Only the presence of locale files was.
- Twikoo's client embed details were not read.
- Comentario's Spanish locale was confirmed on the `dev` branch tree, not in a release artifact.
