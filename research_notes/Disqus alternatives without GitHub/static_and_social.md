<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents** *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Static, serverless and social-network replacements for Disqus](#static-serverless-and-social-network-replacements-for-disqus)
  - [Is it still operating and maintained?](#is-it-still-operating-and-maintained)
    - [Takeaway](#takeaway)
    - [Cited Findings](#cited-findings)
    - [Inferences](#inferences)
    - [Gaps](#gaps)
  - [Can visitors take part with no account?](#can-visitors-take-part-with-no-account)
    - [Takeaway](#takeaway-1)
    - [Cited Findings](#cited-findings-1)
    - [Inferences](#inferences-1)
    - [Gaps](#gaps-1)
  - [Does it work with GitHub Pages' static hosting? Components, cost and free tier](#does-it-work-with-github-pages-static-hosting-components-cost-and-free-tier)
    - [Takeaway](#takeaway-2)
    - [Cited Findings](#cited-findings-2)
    - [Inferences](#inferences-2)
    - [Gaps](#gaps-2)
  - [What work is needed per post, and can it be automated?](#what-work-is-needed-per-post-and-can-it-be-automated)
    - [Takeaway](#takeaway-3)
    - [Cited Findings](#cited-findings-3)
    - [Inferences](#inferences-3)
    - [Gaps](#gaps-3)
  - [How are spam, moderation and notifications handled?](#how-are-spam-moderation-and-notifications-handled)
    - [Takeaway](#takeaway-4)
    - [Cited Findings](#cited-findings-4)
    - [Inferences](#inferences-4)
    - [Gaps](#gaps-4)
  - [Who owns the comment data, can it be exported, and what if the service disappears?](#who-owns-the-comment-data-can-it-be-exported-and-what-if-the-service-disappears)
    - [Takeaway](#takeaway-5)
    - [Cited Findings](#cited-findings-5)
    - [Inferences](#inferences-5)
    - [Gaps](#gaps-5)
  - [What tracking, cookies and third-party requests occur, where is data held, and what is exposed in git?](#what-tracking-cookies-and-third-party-requests-occur-where-is-data-held-and-what-is-exposed-in-git)
    - [Takeaway](#takeaway-6)
    - [Cited Findings](#cited-findings-6)
    - [Inferences](#inferences-6)
    - [Gaps](#gaps-6)
  - [How does it integrate with Jekyll and Minimal Mistakes? Click-to-load? Spanish and English?](#how-does-it-integrate-with-jekyll-and-minimal-mistakes-click-to-load-spanish-and-english)
    - [Takeaway](#takeaway-7)
    - [Cited Findings](#cited-findings-7)
    - [Inferences](#inferences-7)
    - [Gaps](#gaps-7)
  - [Is there evidence of real or low engagement on small blogs?](#is-there-evidence-of-real-or-low-engagement-on-small-blogs)
    - [Takeaway](#takeaway-8)
    - [Cited Findings](#cited-findings-8)
    - [Inferences](#inferences-8)
    - [Gaps](#gaps-8)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Static, serverless and social-network replacements for Disqus

Research date: 2026-11-05. All live tests ran once, from one network, on that date. A single failed request is not an outage history.

Evidence tags used below:

- **[P]** primary source read in this session: project repo, docs, API, GitHub or GitLab API data.
- **[T]** live test run in this session (HTTP request, DNS over HTTPS or local repo read).
- **[R]** practitioner write-up read in this session. This is one person's report.
- **[S]** seen only through a search-result summary. The page itself was not read. Treat as weak.

Blog facts confirmed from the local repo [T]: `_config.yml` sets `comments.provider: "custom"` and `locale: "en-GB"`. `Gemfile` uses the `github-pages` gem. The repo has no `.github/workflows` directory, so the site uses the classic Pages build. `_includes/comments-providers/custom.html` holds a click-to-load Disqus button.

## Is it still operating and maintained?

### Takeaway

Bridgy, webmention.io, the Bluesky public API and Mastodon APIs all answered on 2026-11-05, and their code is active. The public Staticman instance is gone and the project is dormant. The Cactus public service failed every check. Cusdis is deprecated and archived. Garrul is the most active Workers + D1 project, but it is under six months old.

### Cited Findings

Status table. GitHub and GitLab values were read through their APIs on 2026-11-05.

| Project | Last commit | Latest release | Service check | Verdict |
|---|---|---|---|---|
| Staticman | `master` 2020-07-06, `dev` 2021-09-01 | v1.0.0, 2016-08-07 | `api.staticman.net` NXDOMAIN, `staticman3.herokuapp.com` 404 | Dormant, no public instance answering |
| no-comment | 2026-09-26 | none seen | Self-deployed | Active, 0 stars, one author |
| req4cmt | 2026-09-24 | none seen | Self-deployed | Active, 19 stars |
| comment-worker | pushed 2024-03-30 | not checked | Self-deployed | Quiet, 27 stars |
| Garrul | pushed 2026-11-01 | v2.41.0, 2026-10-31 | Self-deployed | Very active, 57 stars, 6 contributors |
| Cactus client | 2023-07-14 | v0.13.0, 2022-07-08 | CDN host unresolvable, homeserver 404 | Treat public service as dead |
| Cactus appservice | 2022-05-07 | 0.9.0, 2022-04-19 | as above | Dormant |
| Bridgy | 2026-11-03 | no releases | `brid.gy` 200 | Active |
| granary (Bridgy library) | 2026-11-03 | v12.0, 2026-10-18 | n/a | Active |
| webmention.io | 2026-10-17 | no releases | 200, API returned data | Active |
| jekyll-webmention_io | pushed 2026-10-19 | v4.2.0, 2026-05-23 | n/a | Active, not usable on classic Pages |
| bluesky-comments-tag (ascorbic) | 2026-05-12 (bot), pushed 2026-11-04 | not checked | n/a | Maintained by dependency bot, 96 stars |
| bluesky-comments (czue) | 2025-10-06 | not checked | n/a | Slowing, 240 stars |
| bsky-comments (florianschepp) | pushed 2026-08-31 | v1.0.1, 2026-02-15 | n/a | Active, 44 stars |
| juttu | pushed 2026-07-14 | v0.4.1, 2026-07-14 | n/a | Active, 16 stars |
| mastodon-comments (dpecos) | 2026-03-31 | no releases | n/a | Quiet, 130 stars |
| social-comments (oom, Mastodon + Bluesky) | 2026-08-21 | not checked | n/a | Moved to Codeberg, 3 stars |
| Waline | 2026-11-04 | @waline/vercel 1.43.4, 2026-09-30 | Self-deployed | Active, 3158 stars |
| Cusdis | 2026-07-17 (README only) | v1.3.0, 2021-11-30 | `cusdis.com` HTTP 521 | Deprecated and archived |

Sources for the table: [Staticman](https://github.com/eduardoboucas/staticman), [no-comment](https://github.com/antenore/no-comment), [req4cmt](https://github.com/est/req4cmt), [comment-worker](https://github.com/zanechua/comment-worker), [Garrul](https://github.com/KingPin/Garrul), [Cactus client](https://gitlab.com/cactus-comments/cactus-client), [Cactus appservice](https://gitlab.com/cactus-comments/cactus-appservice), [Bridgy](https://github.com/snarfed/bridgy), [granary](https://github.com/snarfed/granary), [webmention.io](https://github.com/aaronpk/webmention.io), [jekyll-webmention_io](https://github.com/aarongustafson/jekyll-webmention_io), [bluesky-comments-tag](https://github.com/ascorbic/bluesky-comments-tag), [bluesky-comments](https://github.com/czue/bluesky-comments), [bsky-comments](https://github.com/florianschepp/bsky-comments), [juttu](https://github.com/matteomarjanovic/juttu), [mastodon-comments](https://github.com/dpecos/mastodon-comments), [social-comments](https://codeberg.org/oom-components/social-comments), [Waline](https://github.com/walinejs/waline), [Cusdis](https://github.com/djyde/cusdis).

Staticman:

- [T] `api.staticman.net` returns NXDOMAIN through Cloudflare DNS over HTTPS. `https://staticman3.herokuapp.com/` returned 404. `staticman.net` returned 301 to `best.staticman.net`, which served the Staticman landing page.
- [P] Issue 475, opened 2026-02-23: "staticman.net now hosts copyright-infringing sports streaming content". The reporter received an NBA DMCA claim for linking to the domain. A 2026-05-14 comment says "it appears to be resolved now. Looks like they got the domain back". The issue is still open. [Issue 475](https://github.com/eduardoboucas/staticman/issues/475)
- [P] Other open items include a March 2025 webhook error report and a July 2025 "Collaborator invitation". [Issues](https://github.com/eduardoboucas/staticman/issues)
- [S] An issue thread reports that maintainers dropped the public instance and told users to host their own. [Issue 317](https://github.com/eduardoboucas/staticman/issues/317)
- Could not read: `best.staticman.net/docs/getting-started` returned 404 at the URL tried.

Cactus Comments:

- [T] `https://matrix.cactus.chat:8448/_matrix/client/versions` and `/_matrix/federation/v1/version` both returned 404 with the body "404 page not found". The host resolves to an IP and something answers, but no Matrix server responds on these paths.
- [T] The Matrix federation tester returned `FederationOK: false` for `cactus.chat`. [Report](https://federationtester.matrix.org/api/report?server_name=cactus.chat)
- [T] `latest.cactus.chat` is a CNAME to `cloudflare-ipfs.com`, and that name returned no A record. The script URL in the quick-start therefore cannot load from that host.
- [P] The quick-start still tells new sites to use `https://latest.cactus.chat/cactus.js` and `defaultHomeserverUrl: "https://matrix.cactus.chat:8448"`. The docs site itself is up. [Quick start](https://cactus.chat/docs/getting-started/quick-start/)
- [P] Open issue titled "initComments is not defined", opened 2024-11-10, title only read. No newer issue was returned for the client. [Client issue 81](https://gitlab.com/cactus-comments/cactus-client/-/work_items/81)
- [P] The intro page says the public community server is funded through OpenCollective. [Intro](https://cactus.chat/docs/getting-started/introduction/)
- [S] A search for outage reports found no announcement of a shutdown.

Bridgy and webmention.io:

- [T] `https://brid.gy/` returned 200 with the normal front page.
- [P] Bridgy lists current backfeed for Bluesky, Mastodon, Flickr, GitHub and Reddit. Twitter access was suspended on 2023-04-04. Facebook and Instagram support ended with the browser extension, which ran until 2026-08-07. Blogger and Medium webmentions ended in September 2025. [Bridgy about](https://brid.gy/about)
- [P] Bridgy Fed is a separate service that bridges a website to the fediverse and Bluesky. It is free, and its operators accept donations on Patreon. Live status of `fed.brid.gy` is limited to its docs page loading. [Bridgy Fed docs](https://fed.brid.gy/docs)
- [T] `https://webmention.io/` returned 200. `GET /api/mentions.jf2?target=https://aaronparecki.com/&per-page=1` returned a mention with `wm-received` 2026-09-15.

Bluesky and Mastodon APIs:

- [T] `public.api.bsky.app` returned 200 for `getProfile`, `getAuthorFeed` and `getPostThread`, with no login.
- [T] `public.api.bsky.app/xrpc/app.bsky.feed.searchPosts` returned 403.
- [S] Bluesky's rate-limit docs describe `public.api.bsky.app` as cached, for public web use, with generous limits and no published number. The official page could not be read: `docs.bsky.app` returned a 308 to `bsky.network`, and that page came back empty. [Rate limits](https://docs.bsky.app/docs/advanced-guides/rate-limits)
- [T] `mastodon.social` reports version `5.0.0-nightly.2026-11-05`. `GET /api/v1/statuses/:id/context` returned 200 with no login on both `mastodon.social` and `fosstodon.org`.
- [T] Unauthenticated `GET /api/v1/timelines/public` on `mastodon.social` returned 422. Comment widgets do not need this endpoint.

Other projects:

- [P] Cusdis README: "Cusdis is deprecated now. If you want to export your data. Please email <hi@cusdis.com>." [Cusdis](https://github.com/djyde/cusdis)
- [P] Giscus (last commit 2026-05-26) and utterances (last commit 2022-02-12) are built on GitHub and fail the hard requirement. [giscus](https://github.com/giscus/giscus), [utterances](https://github.com/utterance/utterances)
- [P] Isso 0.14.0 (2026-03-26) and Remark42 v1.18.0 (2026-10-11) are active but need an always-on server. [Isso](https://github.com/isso-comments/isso), [Remark42](https://github.com/umputun/remark42)
- [R] One GitHub Pages blogger runs Isso in Docker on a home server. [Chapien](https://chapien-net.pages.dev/blog/2025/comments-enabled-and-goodbye-to-webmentions)

### Inferences

- The `cloudflare-ipfs.com` dead end probably explains why old Cactus embeds fail with `initComments is not defined`. The date and title fit, but I did not read the issue body.
- Staticman's domain was lost for months in 2026. Any setup that depends on staticman.net assets or docs carries a reputational risk. Do not link to that domain from the blog until the status is clear. The `best.` redirect looks odd for a recovered domain.
- Garrul shipped 95 releases since 2026-05-18 (GitHub API). This shows energy and also an upgrade burden, with a small maintainer base.

### Gaps

- Cactus has no status page that I could find. I cannot say when the public homeserver stopped, or whether a maintainer knows. Self-hosting on a separate Matrix homeserver was not tested.
- comment-kit (`fardm/comment-kit`) appeared in search but returned 404 on GitHub and through the API. Not assessed.
- Web3Forms pricing returned HTTP 403. Not read.
- The Bluesky rate-limits page could not be read directly. The figure of 3,000 requests per 5 minutes in one third-party guide refers to the hosted PDS, not this API, and is not confirmed.
- The Cactus moderation page returned 404 at the URL tried (`/docs/community/moderation/`), so moderation is not confirmed.

## Can visitors take part with no account?

### Takeaway

Only form-based options allow true guests: Garrul, form-to-email, form-to-pull-request flows and a self-hosted Staticman. A plain email line needs only an email address. Bluesky, Mastodon and webmentions all need an account on another network or a personal website. None needs GitHub, except Giscus and utterances, which are excluded.

### Cited Findings

| Approach | Commenter needs | GitHub needed? |
|---|---|---|
| Self-hosted Staticman | Nothing, HTML form | Owner only |
| Form-to-PR Worker | Nothing, HTML form | Owner only |
| Form-to-email | Nothing, HTML form | No |
| Garrul | Nothing. Optional OAuth with GitHub, Google, Discord, Facebook, X | No |
| Cactus | Guest posting by default if the homeserver allows guest registration, or any Matrix account | No |
| Webmentions + Bridgy | Bluesky or Mastodon account, or a site that sends webmentions | No |
| Bluesky replies | Bluesky account | No |
| Mastodon replies | Account on any ActivityPub server | No |
| Reply by email | An email address and a mail client | No |
| Reply by social | The relevant social account | No |

- [P] Garrul: anonymous posting, rate limited and Turnstile gated, plus optional OAuth. [Garrul README](https://github.com/KingPin/Garrul), [site](https://garrul-site.pages.dev/)
- [P] Cactus `guestPostingEnabled` defaults to true. The client registers a guest account on the homeserver and stores the access token in localStorage. This requires the homeserver to allow guest registrations. [Cactus client docs](https://cactus.chat/docs/client/introduction/)
- [P] no-comment takes an HTML form and creates pull requests. [no-comment](https://github.com/antenore/no-comment)
- [P] req4cmt README: "no signups, no login". [req4cmt](https://github.com/est/req4cmt)
- [R] Mastodon flow: readers reply from any ActivityPub account. [Cassidy James, 2023-07-06](https://cassidyjames.com/blog/fediverse-blog-comments-mastodon/)
- [P] Bridgy only handles fully public posts and responses. Unlisted and followers-only replies never appear. [Bridgy about](https://brid.gy/about)
- [P] Juttu lets a visitor log in with Bluesky inside the widget to like, repost or reply. Other Bluesky widgets are read-only. [Juttu](https://github.com/matteomarjanovic/juttu)
- [R] With read-only widgets, readers respond on Bluesky itself. [Cory Zue, 2024-11-25, updated 2025-02-24](https://coryzue.com/writing/bluesky-comments)

### Inferences

- Reader overlap matters. A Spanish or English reader without Bluesky or Mastodon cannot comment on the page through these routes. They can still email, which argues for always keeping an email line.
- A Mastodon user on another server must paste the post URL into their own instance to reply. This is a known friction of the fediverse, and I did not find a source that measures it.

### Gaps

- No source measures how many blog readers hold a Bluesky or Mastodon account.

## Does it work with GitHub Pages' static hosting? Components, cost and free tier

### Takeaway

All options work with Pages as the front end. Every guest option needs a separate component, usually one Cloudflare Worker on the free plan. Social options need only client-side JavaScript. The cost for this blog can be 0 EUR per month on all viable routes. The one trap: `jekyll-webmention_io` cannot run on the current classic build.

### Cited Findings

| Approach | Separate components | Cost |
|---|---|---|
| Staticman | Your own Node host, GitHub token or App, reCAPTCHA or Akismet | Host cost, see Gaps |
| no-comment or req4cmt | Cloudflare Worker, Git token | Workers free plan |
| Form-to-email | Form service. A Worker with a mail sender is also possible (my inference, not researched) | Formspree free: 50 submissions a month |
| Garrul | Worker, D1, KV, Turnstile. Optional Resend, Akismet, Workers AI | Free tier, paid Workers from $5 a month |
| Cactus | Matrix homeserver with appservice when self-hosted | Public service failed checks |
| Webmention.io + Bridgy | Two hosted services, client-side embed | Free for users |
| Bluesky or Mastodon display | None, client JS. Optional GitHub Action | 0 |
| Email line | None | 0 |
| Waline | Vercel plus Neon Postgres | Docs page does not state free limits |

- [P] D1 free plan: 5 million rows read a day, 100,000 rows written a day, 5 GB total storage, 10 databases. Page updated 2026-10-30. [D1 pricing](https://developers.cloudflare.com/d1/platform/pricing/)
- [P] Garrul's own page, checked by its authors on 2026-08-01: Workers 100,000 requests a day, D1 5 GB and 5 million row reads a day, KV 100,000 reads and 1,000 writes a day, Turnstile 20 widgets per account. Paid Workers from $5 a month. [Garrul](https://garrul-site.pages.dev/)
- [P] Turnstile free plan: up to 20 widgets, unlimited challenges, 10 hostnames per widget. [Turnstile plans](https://developers.cloudflare.com/turnstile/plans/)
- [P] Formspree free plan: 50 submissions a month, basic spam filtering, 30-day dashboard archive. Personal plan $15 a month or $120 a year. [Formspree plans](https://formspree.io/plans)
- [P] Bridgy costs users nothing and its running cost is "less than $50/month". [Bridgy about](https://brid.gy/about)
- [P] The webmention.io home page states no price. [webmention.io](https://webmention.io/)
- [P] GitHub Pages' published gem list includes `jekyll` and no webmention plugin. [Pages versions](https://pages.github.com/versions.json)
- [P] `jekyll-webmention_io` fetches mentions at build time and needs a webmention.io account with IndieAuth set up. [Plugin docs](https://github.com/aarongustafson/jekyll-webmention_io)
- [P] The webmention.io embed is a three-line client-side script with no dependencies. [webmention.io](https://webmention.io/)
- [P] Waline's quick start deploys to Vercel with a Neon database. [Waline](https://waline.js.org/en/guide/get-started/)
- [P] no-comment's GitHub fine-grained token has a maximum validity of one year, so it needs renewal. [no-comment](https://github.com/antenore/no-comment)
- [P] Cloudflare publishes a tutorial for a comments API with D1 and Hono. [D1 tutorial](https://developers.cloudflare.com/d1/tutorials/build-a-comments-api)

### Inferences

- Comment volume on this blog is zero today, so free limits will not bind on any route. Spam volume is the only load risk, and Turnstile plus rate limits address it.
- On the classic build, webmentions must render client side. Build-time rendering needs a move to GitHub Actions deploys, with a scheduled rebuild for fresh mentions.
- A token that expires yearly is a maintenance event with silent failure. The form would stop working until someone notices.

### Gaps

- Heroku pricing for a Staticman host was not checked this session. From memory, Heroku ended its free tier in 2022, which is unverified here.
- Resend free limits for Garrul email were not checked.
- Workers free limits were not read on a Cloudflare page. The figure comes from Garrul's page and [a 2023 post on damieng.com](https://damieng.com/blog/2023/cloudflare-blog-comment-receiver/).

## What work is needed per post, and can it be automated?

### Takeaway

Form and Worker systems need no per-post work. Bluesky and Mastodon need one social post per blog post, plus an ID in front matter, which means publishing twice. Automatic discovery on Bluesky no longer works. Automation exists but it costs more to build than the task costs by hand for a rarely published blog.

### Cited Findings

- [R] Bluesky manual flow: publish, share, copy the ID to front matter, republish. David Aversa calls this a "double publish" and a minor annoyance. [Aversa, 2024-12-12](https://davideaversa.it/blog/bluesky-comments/)
- [R] Cory Zue's auto-discovery by search "appears to have broken" because Bluesky closed public access to its search endpoint. Manual linking is required. [Zue, update 2025-02-24](https://coryzue.com/writing/bluesky-comments)
- [T] This is confirmed today: `searchPosts` on `public.api.bsky.app` returned 403.
- [P] bsky-comments accepts either a public `bsky.app` URL or an AT URI, so front matter can hold the URL pasted from the app. [bsky-comments](https://github.com/florianschepp/bsky-comments)
- [P] bluesky-comments-tag takes a `url` attribute with the post URL. [bluesky-comments-tag](https://github.com/ascorbic/bluesky-comments-tag)
- [P] Mastodon dpecos component needs `host`, `user` and `tootId`. [mastodon-comments](https://github.com/dpecos/mastodon-comments)
- [R] Cassidy James adds the Mastodon ID by hand. He lists automation as a future wish. [Cassidy James](https://cassidyjames.com/blog/fediverse-blog-comments-mastodon/)
- [R] The bitsgalore.org author wrote a commentsBot using Mastodon.py and Python Frontmatter. It posted threads for about 80 posts from a dedicated account and wrote `ap_id` into each post. He used a separate account so readers would not join blog comments unknowingly. [Bitsgalore, 2025-04-30](https://bitsgalore.org/2025/04/30/changes-to-the-blog-migration-to-codeberg-and-activitypub-based-comments)
- [R] Julian Fietkau auto-shares every new post from a dedicated account. His auto-poster is tied to his custom generator. [Fietkau, 2023-06-30](https://fietkau.blog/2023/another_blog_resurrection_fediverse_new_comment_system)
- [S] A GitHub Actions workflow detects new posts, posts through `zentered/bluesky-post-action`, inserts the returned URI with `sed` and commits. The site is not Jekyll. [Woodward Web, 2025-08](https://www.woodwardweb.com/post/2025/08/automated-bluesky-integration)
- [P] Bridgy Fed removes the manual social post. The site becomes an account, and Bridgy Fed reads new posts from an RSS or Atom feed or from a webmention. Replies come back as webmentions, so the site still needs an endpoint such as webmention.io. Only fully public posts made after enabling are bridged, and posts older than two weeks are not. Custom handles need `/.well-known/host-meta` and `/.well-known/webfinger` redirects. Without them the address is `@yourdomain.com@web.brid.gy`. The docs do not cover static sites specifically. [Bridgy Fed docs](https://fed.brid.gy/docs)
- [P] Juttu links an article through a generated `site.standard.document` AT URI, using `npx juttu site-document`. This adds a separate per-article step. [Juttu](https://github.com/matteomarjanovic/juttu)
- [P] Bridgy needs a link to your site in the social post, or a syndication link. It looks only at your 30 most recent posts. It polls about every 30 minutes, and about once a day for accounts with no recent webmention. [Bridgy about](https://brid.gy/about)

### Inferences

- With webmentions, no ID goes in front matter, but each post still needs a social post that links to it.
- Bridgy's 30-post window is a risk here: the blog posts rarely while the owner may post often on social. A blog-linked post can fall out of the window after 30 later social posts, and then new replies stop being collected. The page offers a "Crawl now" refetch, and I did not test whether it reaches past the window.
- GitHub Pages cannot configure those redirects, so a Bridgy Fed fediverse address would probably stay at the `web.brid.gy` default. Not tested.
- Bridgy Fed is the only route found that removes per-post social work. Replies would go to a new site account, separate from the owner's existing Bluesky and Mastodon followers, so it starts with no audience.
- For a rare publisher, a two-minute manual step beats a CI workflow that holds social credentials and commits to `main`.
- Spanish and English versions of the same idea need separate threads if they are separate posts.

### Gaps

- I found no maintained Jekyll-specific action that does the full flow of posting and writing the ID to front matter.

## How are spam, moderation and notifications handled?

### Takeaway

PR-based flows give real pre-approval, because nothing appears until a merge. Garrul has the fullest moderation tools. Social options inherit platform blocks and have weak control over what shows on the page, but a "show only replies I liked" filter gives a form of approval. The email line has no public spam, because nothing publishes automatically.

### Cited Findings

- [P] Minimal Mistakes' sample Staticman config: `moderation: true`, `reCaptcha` block, optional Akismet. [staticman.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/staticman.yml)
- [P] no-comment: "you have to approve manually to eliminate comment spam". Optional Akismet. [no-comment](https://github.com/antenore/no-comment)
- [R] The damieng.com Worker opens one branch and one PR per comment, with optional Turnstile. [damieng.com, 2023-10-24](https://damieng.com/blog/2023/cloudflare-blog-comment-receiver/)
- [S] req4cmt lists PR moderation as a future item, so comments commit directly. [Ecosyste.ms entry](https://awesome.ecosyste.ms/projects/github.com%2Fest%2Freq4cmt)
- [P] Garrul: Turnstile, rate limits, sanitising and a honeypot always on, optional Akismet or Workers AI. Flagged comments go to a queue. Tools include banning, muted words and Telegram actions. Moderator email digests are off by default. Signed webhooks and Telegram alerts are available. [Garrul](https://garrul-site.pages.dev/)
- [P] Webmention.io: rejecting, deleting and blocking a source are on the dashboard. Mentions held for moderation are not sent to webhooks or exports until approved. Webhooks are signed and retried. The docs have no dedicated spam section. [webmention.io API](https://webmention.io/api)
- [P] Bridgy: "If so, Bridgy won't send you any of their responses" applies to authors blocked inside the silo. [Bridgy about](https://brid.gy/about)
- [S] Users blocked on Bluesky do not show up in blog comments, in one search summary with no identified source page.
- [R] One write-up claims "BlueSky automatically handles moderation for you", without detail. [TechAsHuman, 2024-11-26](https://techashuman.substack.com/p/integrating-bluesky-comments)
- [R] Bluesky API limit as of December 2024: no way to exclude replies marked "hidden for all". The author's fix is to display only replies he has liked. He also adds DOMPurify to prevent DOM injection. [Aversa](https://davideaversa.it/blog/bluesky-comments/)
- [P] dpecos Mastodon component has `filter="favorites"`, documented as filtering displayed toots. [mastodon-comments](https://github.com/dpecos/mastodon-comments)
- [R] Fietkau describes no moderation tools. Only "public" replies display, so readers can opt out by replying as unlisted. [Fietkau](https://fietkau.blog/2023/another_blog_resurrection_fediverse_new_comment_system)
- [P] Cactus docs reference a moderation guide, which could not be read. [Intro](https://cactus.chat/docs/getting-started/introduction/)
- [R] Hidde de Vries added a "Reply via email" link because long comments in his queue came mostly from content marketers seeking backlinks. [de Vries, 2020-07-14](https://hidde.blog/reply-via-email)
- [P] Formspree free plan has basic filtering. Advanced spam control is paid. [Formspree plans](https://formspree.io/plans)

### Inferences

- Notifications: PR flows use GitHub's own PR email. Form-to-email is the notification. Bluesky and Mastodon notify through the app, because the reply is a normal reply.
- Email-only spam stays private, and a published address can attract harvesters. Normal mailbox filtering handles this at no setup cost.
- A filter by favourites turns social replies into pre-approval on the page. It adds one action per reply, which fits a blog with almost none.

### Gaps

- I did not confirm the current Bluesky thread API fields for hidden replies. The lexicon URL tried returned 404, so the December 2024 limit may have changed.
- Spam rate for Staticman or Worker forms on a small blog: no measured data found.

## Who owns the comment data, can it be exported, and what if the service disappears?

### Takeaway

Git-based flows and Garrul give the owner direct custody. Social replies belong to the commenter and their platform, and the page goes blank if the thread or API goes away. Webmention.io has a real export. Cusdis shows the failure mode: deprecated, with export by email request only.

### Cited Findings

- [P] Staticman and PR flows store comments as files in your repo. Minimal Mistakes uses `_data/comments/{options.slug}`. [staticman.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/staticman.yml)
- [P] req4cmt: "Every data is self-contained in a git repo". It speaks plain git-http, so it works with any git remote. [req4cmt](https://github.com/est/req4cmt)
- [P] Garrul exports all posts, comments and users as JSON or CSV, or through `npm run db:export`. It imports from Disqus, Remark42, Comentario or Commento, Isso and Cusdis. D1 is your database. Apache 2.0. [Garrul](https://garrul-site.pages.dev/)
- [P] Webmention.io `export.jf2` returns all published mentions for an account or domain, once per five minutes. `deleted.jf2` lists removals. [API](https://webmention.io/api)
- [P] Webmention.io is open source (BSD) and can be run separately, with Ruby, MySQL and Redis. [README](https://github.com/aaronpk/webmention.io)
- [P] Bridgy: "We store all data permanently, but not all in Bridgy itself", and responses are archived to BigQuery after one to two years. "Bridgy is a service, not a data storage provider." [Bridgy about](https://brid.gy/about)
- [R] Bluesky comments depend on a third party, and Aversa accepts that because he trusts Disqus less. [Aversa](https://davideaversa.it/blog/bluesky-comments/)
- [P] Cusdis: export needs an email to the project from your signed-up address. [Cusdis README](https://github.com/djyde/cusdis)
- [P] Mastodon API: a status context is public for public statuses. Unauthenticated requests get up to 40 ancestors and 60 descendants, with a maximum depth of 20. From Mastodon 4.5, the endpoint may start background jobs to fetch missing replies. The page does not promise that every cross-server reply appears. [Mastodon docs](https://docs.joinmastodon.org/methods/statuses/#context)
- [T] An unauthenticated context request on `fosstodon.org` for a demo toot returned exactly 60 descendants, which matches the cap.

### Inferences

- Client-side Bluesky and Mastodon comments disappear from the page when the root post is deleted, the commenter deletes, the instance goes down or the API changes. Bitsgalore shows the migration cost in reverse: moving away from GitHub issues required archiving old comments as JSON in `_data`.
- A Mastodon widget shows what the author's server knows. Replies from other servers can be missing or late, and a very long thread gets cut at 60 with no login. Neither limit should matter at this blog's volume, apart from the missing replies.
- A small script could snapshot replies to `_data` for permanence, but this republishes third-party personal data under the owner's control.
- Email replies live only in the owner's mailbox. Nothing public exists to lose or preserve.

### Gaps

- I did not find a documented export route for Bluesky thread replies other than the public API.

## What tracking, cookies and third-party requests occur, where is data held, and what is exposed in git?

### Takeaway

No option needs ads or tracking cookies. The sharp GDPR issue is committing commenter data to a public git repo, since names, URLs and comment text enter permanent public history, and Staticman's default stores an MD5 of the email. Client-side social widgets send each visitor's IP to the API host, so the existing click-to-load button remains useful.

### Cited Findings

- [P] Minimal Mistakes Staticman sample: `allowedFields: ["name", "email", "url", "message"]`, `requiredFields: ["name", "email", "message"]`, `transforms: email: md5`. [staticman.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/staticman.yml)
- [R] The damieng.com Worker writes name, email, avatar and URL to frontmatter and uses the supplied email as the commit author email. No hashing is described. [damieng.com](https://damieng.com/blog/2023/cloudflare-blog-comment-receiver/)
- [P] no-comment's form has an email field and optional client-side encrypted email support. Emails are decrypted only in memory for Akismet. Otherwise plain emails work "normally". [no-comment](https://github.com/antenore/no-comment)
- [P] req4cmt README: "NO cookie". [req4cmt](https://github.com/est/req4cmt)
- [P] Garrul stores comment bodies, author names, emails for OAuth users and digest subscribers, HMAC-SHA-256 hashed IP addresses, user-agent strings and OAuth IDs. "No analytics, no tracking pixels, no advertising, no Gravatar. One strictly-necessary cookie." It has a per-user export and an erase panel. The README states that the site operator is the controller and that the project does not claim compliance. It ships a privacy-policy template and compliance docs. [Garrul README](https://github.com/KingPin/Garrul)
- [P] D1 can be restricted to the EU with `--jurisdiction=eu`, set at creation only. Location hints are not guarantees. Workers can still access it from anywhere. [D1 data location](https://developers.cloudflare.com/d1/configuration/data-location/)
- [P] Cactus guest mode stores an access token in localStorage. [Client docs](https://cactus.chat/docs/client/introduction/) An open issue is titled "Logged-in users are tracked (because of missing peeking)". Title only read. [Issue 78](https://gitlab.com/cactus-comments/cactus-client/-/work_items/78)
- [T] `public.api.bsky.app` responses carried `access-control-allow-origin: *` and no `set-cookie` header. `mastodon.social` API responses carried the same CORS header and no `set-cookie` header.
- [P] Bluesky privacy policy, updated 2025-08-14: "We may transfer, process, and store all personal information we collect anywhere in the world". Standard Contractual Clauses are cited for EEA transfers. It names an EU representative in Cork. It says most activity is public by design. [Bluesky privacy](https://bsky.social/about/support/privacy-policy)
- [P] Third-party loads in published embed examples: `esm.sh` for bluesky-comments-tag, `cdn.jsdelivr.net` for Juttu, `cdnjs.cloudflare.com` for dpecos DOMPurify and Font Awesome. [bluesky-comments-tag](https://github.com/ascorbic/bluesky-comments-tag), [Juttu](https://github.com/matteomarjanovic/juttu), [mastodon-comments](https://github.com/dpecos/mastodon-comments)
- [P] Bridgy says it stores "as little of your PII... as possible", notes the GDPR export duty, and offers export or deletion on request. `#nobridge` or `#nobot` in a profile bio opts out of backfeed. [Bridgy about](https://brid.gy/about)
- [P] Bridgy requests blanket read and write on Mastodon and uses an app password for Bluesky. [Bridgy about](https://brid.gy/about)
- [P] The webmention.io page states no retention policy. Its webhook payloads and stored mentions include author data from the source page. [webmention.io](https://webmention.io/), [API](https://webmention.io/api)
- [P] Formspree free plan keeps submissions 30 days. Data location is not stated. [Formspree plans](https://formspree.io/plans)

### Inferences

These are engineering readings of risk, not legal advice.

- MD5 of an email is pseudonymous, not anonymous, because common addresses can be hashed and matched. It should count as personal data in a public repo.
- Erasure in git needs a history rewrite and cannot reach forks or clones. A form flow into a public repo should collect name and comment only, with an explicit notice. Do not collect email in the committed file, and do not set it as commit author.
- A private comments repo plus build-time merging would remove the exposure, but it adds a deploy pipeline that the classic Pages build cannot run.
- A Worker form processes IPs through Cloudflare, and Turnstile loads a Cloudflare script, so the click-to-load notice should name Cloudflare.
- Social replies are already public posts by the commenter. Displaying them client side republishes less than storing them, but the page still shows names and avatars and may need a line in the privacy notice. The current notice text about Disqus and Google Fonts would need rewriting for any replacement.
- Self-host the widget script from the blog's own domain to remove `esm.sh`, jsDelivr or cdnjs requests. API requests remain, and these are why the button should stay.

### Gaps

- Avatars in Bluesky or Mastodon widgets load from platform CDNs, and I did not capture the network requests from a live widget.
- Turnstile cookies and Cloudflare's data processing terms were not read. The Turnstile plan page is silent on cookies.
- Where Bridgy and webmention.io host data: neither page I read states this.

## How does it integrate with Jekyll and Minimal Mistakes? Click-to-load? Spanish and English?

### Takeaway

Everything except built-in Staticman goes through the existing `custom` provider include, which already has the click-to-load pattern. Injecting a script after the click works for all client-side options. Spanish UI text exists out of the box for Garrul and Minimal Mistakes. Social widgets show few strings, so a small override may do.

### Cited Findings

- [P] Minimal Mistakes providers: `disqus`, `discourse`, `facebook`, `staticman_v2`, `staticman` (v1, deprecated), `utterances`, `giscus`, `custom`. Custom embed code goes in `_includes/comments-providers/custom.html`. [Configuration](https://mmistakes.github.io/minimal-mistakes/docs/configuration/)
- [P] Staticman v3 needs `comments.staticman.endpoint` set to your own API. [Configuration](https://mmistakes.github.io/minimal-mistakes/docs/configuration/)
- [T] Minimal Mistakes `_data/ui-text.yml` has `es`, `es-ES` and `es-CO`, plus `en-GB`. Latest release is 4.28.1, 2026-08-11. [ui-text.yml](https://github.com/mmistakes/minimal-mistakes/blob/master/_data/ui-text.yml), [releases](https://github.com/mmistakes/minimal-mistakes/releases)
- [P] Garrul has `src/i18n/es.ts` and `src/i18n/widget/es.ts`. Its page says twelve widget languages, with an English-only admin. [Garrul repo](https://github.com/KingPin/Garrul), [site](https://garrul-site.pages.dev/)
- [P] Waline has a `lang` option and a Spanish docs site. The page read does not confirm Spanish for the widget. [Waline](https://waline.js.org/en/guide/get-started/)
- [P] Cactus `initComments` is global and can be called at any time, so click-to-load is possible in principle. [Client docs](https://cactus.chat/docs/client/introduction/)
- [P] bluesky-comments-tag and dpecos' mastodon-comments lazy load once visible. This is not the same as loading after a click. [bluesky-comments-tag](https://github.com/ascorbic/bluesky-comments-tag), [mastodon-comments](https://github.com/dpecos/mastodon-comments)
- [R] Cory Zue runs `bluesky-comments` on Jekyll with `bluesky_post_uri` in front matter, plus a React import map. [Zue](https://coryzue.com/writing/bluesky-comments)
- [R] Cassidy James runs Mastodon comments on Jekyll, based on Jan Wildeboer's code, and moved to auto-load. [Cassidy James](https://cassidyjames.com/blog/fediverse-blog-comments-mastodon/)
- [R] Bitsgalore uses `ap_id` in Jekyll front matter, with client-side JS. [Bitsgalore](https://bitsgalore.org/2025/04/30/changes-to-the-blog-migration-to-codeberg-and-activitypub-based-comments)
- [P] bsky-comments uses light DOM, so site CSS applies. bluesky-comments-tag uses Shadow DOM with CSS variables. [bsky-comments](https://github.com/florianschepp/bsky-comments), [bluesky-comments-tag](https://github.com/ascorbic/bluesky-comments-tag)
- [T] The blog's existing button injects a script on click, in `_includes/comments-providers/custom.html`. The same pattern fits a web component script.

### Inferences

- Stable Liquid fields such as `bluesky_post_url` or `mastodon_toot_id` fit the include. Show the block only when the field is set, so old posts stay clean.
- A form flow also needs Liquid to render merged comments from `_data`. This is built in only for the Staticman provider, so no-comment or req4cmt can reuse the Minimal Mistakes Staticman templates if the data format matches. no-comment claims to be a drop-in Staticman replacement. Not tested.
- For a plain email line, a `mailto:` with a pre-filled subject of the post title is one Liquid line per language. It works without JavaScript.
- Comment text stays in whatever language the commenter used, in all options.

### Gaps

- Garrul's `docs/embedding.md` was not read, so click-to-load is unconfirmed by its docs. The script-injection pattern should work.
- i18n support for each social widget was not checked. The READMEs read do not mention it.
- The blog's way of marking Spanish posts was not reviewed. `site.locale` is global at `en-GB`, and a quick grep found one post with a Spanish `lang` or `locale` field.

## Is there evidence of real or low engagement on small blogs?

### Takeaway

No source gives measured comment counts for small blogs under any approach. Practitioner statements lean toward low use. Several people dropped webmentions for low value, and one high-follower blogger dropped them for too much noise. This suggests the reader's audience size matters more than the tool. With zero comments so far, expect few under any option.

### Cited Findings

- [R] The deepakness.com author removed webmentions on 2026-08-07: "not adding much value", "the webmention block mostly cluttered the bottom of posts". He kept email and Mastodon replies. He adds "I am not against the webmention protocol". [deepakness.com](https://deepakness.com/raw/removing-webmentions/)
- [R] Chapien moved from webmentions to Isso on 2025-07-01 and still receives webmentions but no longer shows them. No numbers. "Doesn't expect much engagement". [Chapien](https://chapien-net.pages.dev/blog/2025/comments-enabled-and-goodbye-to-webmentions)
- [R] Kev Quirk removed Mastodon webmentions on 2020-04-15. With nearly 10,000 followers, every like and boost arrived as a comment, which was more than he wanted to manage. [Kev Quirk](https://kevquirk.com/removing-mastodon-webmention-from-my-indieweb)
- [S] A brainbaking.com commit disabled webmention fetching and display, with a comment dated "08/05/2023". Day and month order is unknown. [Commit](https://git.brainbaking.com/wgroeneveld/brainbaking/commit/1009e6f756ebfa7b193d881d1d0a911464830d29)
- [R] Aversa, on Bluesky comments: comments are rarely used on blogs generally, and he does not get many. No numbers. [Aversa](https://davideaversa.it/blog/bluesky-comments/)
- [R] TechAsHuman frames Bluesky linking as a way to skip moderation and infrastructure. It reports no results. [TechAsHuman](https://techashuman.substack.com/p/integrating-bluesky-comments)
- [R] Hidde de Vries offers reply by email and gives no reply counts. [de Vries](https://hidde.blog/reply-via-email)
- [R] A data blog post on a Netlify preview domain, whose publisher I could not confirm, studies about 73,000 Bluesky posts with at least one comment and reports median engagement of 13 to 15. It covers social posts, not blog comment widgets, and the sample excludes posts with no comments. [Winternheimer, 2025-10-23](https://symphonious-shortbread-cd2770.netlify.app/posts/bluesky-engagement-and-comments)

### Inferences

- Comment volume on social routes depends on the owner's follower count on that network and on who sees the post. The blog's own readers come second.
- A rarely publishing blog gives a social thread only a short burst of attention. A reader arriving months later from search can still reply, but few will find the old thread worthwhile. Email has no such decay.
- Guest forms remove the account barrier, but I found no evidence that they raise comment volume on small blogs.
- Honest comparison for this owner: Disqus produced zero real comments, so the tool may not be the limit. The default should be the cheapest option to run. Add machinery only if demand appears.

Option ranking, as my own judgment:

1. Email and social reply line, with no widget. Cost 0, no third-party requests, no consent notice, no moderation. Guests can email. Replies are not public, which is the real loss.
2. Line plus Bluesky or Mastodon display behind the existing button, per post, only when a social post exists. Self-host the script. Filter to liked replies.
3. Garrul with a D1 EU database, only if public guest comments are a firm requirement. It is the best fit on features, and the risk is the project's youth and frequent releases.
4. no-comment style form-to-PR, only if comments must live in the repo. The public git exposure needs care, and the single maintainer states "works for me".

Rejected on current evidence: public Staticman (no instance), Cactus public service (failed all checks), Cusdis (deprecated), Giscus and utterances (GitHub required), webmention.io with Bridgy as the main channel (two extra services and page clutter, with several practitioners dropping it), and Disqus-style hosted services with ads.

### Gaps

- A search summary mentioned a blogger whose emails outnumbered blog comments, without a count. I could not tell which result held the claim, so it is unconfirmed.
- No controlled or even informal before-and-after count for any option on a small blog.
- No write-up found of someone abandoning Bluesky comments after a period of use. Search returned only launch posts, so the sample leans toward enthusiasm.
- Hosted options outside this scope, such as Hyvor Talk or Commento, were not assessed here. Discourse embed and Hypothes.is were not researched beyond noting that Minimal Mistakes supports Discourse.
