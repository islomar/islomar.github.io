<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents** *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Replace Disqus with FastComments' EU region](#replace-disqus-with-fastcomments-eu-region)
  - [Most of the market fails one hard constraint](#most-of-the-market-fails-one-hard-constraint)
  - [FastComments wins on commitment, and Hyvor wins on simplicity](#fastcomments-wins-on-commitment-and-hyvor-wins-on-simplicity)
  - [Zero comments argue for keeping the exit cheap](#zero-comments-argue-for-keeping-the-exit-cheap)
  - [Everything below is unverified, and most of it closes with one test post](#everything-below-is-unverified-and-most-of-it-closes-with-one-test-post)
  - [Conclusion](#conclusion)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Replace Disqus with FastComments' EU region

**Use FastComments Flex on its EU region as the next-best option.** It has no ads, takes guests with a name only once anonymous mode is on, has a Spanish UI, and costs about $1 a month by my arithmetic, with no annual commitment. The runner-ups, in order, are Hyvor Talk Personal, GraphComment Free, and Waline on Vercel and Neon. The choice between FastComments and Hyvor is close, and one factor decides it: this blog has zero real comments, so a monthly bill near $1 beats a prepaid €50 a year. Hyvor is the better pick if the FastComments trial fails, because guests give a name only by default and its price is fixed and published. No researcher signed up for a service, ran an embed or captured network traffic, so every cookie and third-party statement is a vendor claim. The only live tests were HTTP and DNS checks on 2026-11-05. Both finalists offer a free trial with no card, so one test post settles most open items. Zero comments on Disqus also suggests the tool may not be the limit, so add an email reply line whichever service you choose.

## Most of the market fails one hard constraint

The constraints apply in order: no ads, no GitHub, guests without an account, Spanish UI, low maintenance, and then the GDPR paperwork. Four options survive to comparison, though GraphComment's guest mode on a static site is unconfirmed and Waline is weak on maintenance.

| | FastComments Flex, EU | Hyvor Talk Personal | GraphComment Free | Waline, Vercel + Neon |
|---|---|---|---|---|
| Cost | $0.99 base plus usage, about $1 a month (my estimate) ([pricing](https://fastcomments.com/traffic-pricing)) | €50 a year, billed annually ([pricing](https://hyvor.com/talk/pricing)) | $0 up to 1M data loads ([pricing](https://www.graphcomment.com/en/pricing)) | $0 within free limits ([Vercel](https://vercel.com/docs/plans/hobby), [Neon](https://neon.com/pricing)) |
| Guest needs | Name, after enabling anonymous mode. Default also asks for an email ([docs](https://docs.fastcomments.com/guide-customizations-and-configuration.html)) | Name. Email optional. On by default ([docs](https://hyvor.com/talk/docs/commenting)) | Stated for the WordPress plugin only ([plugin](https://en-gb.wordpress.org/plugins/graphcomment-comment-system/)) | Nothing required by default ([props](https://waline.js.org/en/reference/client/props.html)) |
| Spanish UI | `es_es` ([docs](https://docs.fastcomments.com/guide-supported-languages.html)) | `es` ([docs](https://hyvor.com/talk/docs/language)) | ES ([pricing](https://www.graphcomment.com/en/pricing)) | `es` ([docs](https://waline.js.org/en/guide/features/i18n.html)) |
| Pre-approval | Off by default, can apply to all comments ([docs](https://docs.fastcomments.com/guide-moderation.html)) | Per page or site-wide ([docs](https://hyvor.com/talk/docs/moderation)) | Not confirmed on a static embed | `COMMENT_AUDIT`, off by default ([env](https://waline.js.org/en/reference/server/env.html)) |
| Operator and data | US LLC, EU hosting, SCCs ([DPA](https://eu.fastcomments.com/dpa)) | French operator (unverified), Hetzner Germany, US sub-processors ([list](https://hyvor.com/sub)) | French operator, EU hosts, documents conflict ([DPA](https://www.graphcomment.com/en/dpa)) | You choose EU regions, on US-owned platforms ([Neon](https://neon.com/docs/introduction/regions)) |
| Your work | Settings once | Settings once, sign and email a DPA ([compliance](https://hyvor.com/compliance)) | Settings once, plus a guest test | Deploy, change third-party defaults, apply upgrades |

Everything else assessed fails on a stated requirement or on evidence of decay.

| Rejected | Reason | Source |
|---|---|---|
| giscus, Utterances, Gitalk | GitHub-backed by design | [giscus](https://github.com/giscus/giscus), [Gitalk](https://github.com/gitalk/gitalk) |
| Cusdis | Deprecated and archived, site returned HTTP 521 | [README](https://raw.githubusercontent.com/djyde/cusdis/master/README.md) |
| Commento hosted, Commento self-hosted | `commento.io` returned 404, repo last pushed 2022 | [commento.io](https://commento.io/), [repo](https://github.com/adtac/commento) |
| HyperComments, JustComments | Domain serves a gambling page; domain looks parked | Live checks of hypercomments.com and justcomments.com, 2026-11-05 |
| Staticman public instance | `api.staticman.net` NXDOMAIN, `staticman.net` reported serving infringing streams in 2026 | [issue 475](https://github.com/eduardoboucas/staticman/issues/475) |
| Cactus public service | Homeserver 404, script host unresolvable | [quick start](https://cactus.chat/docs/getting-started/quick-start/) |
| EchoThread | No Spanish, US hosting, no DPA mentioned | [home](https://echothread.io/), [privacy](https://echothread.io/privacy) |
| Twikoo, Artalk | No Spanish UI in source | [Twikoo](https://github.com/twikoojs/twikoo/tree/main/packages/client/src/i18n/locales), [Artalk](https://artalk.js.org/guide/frontend/i18n.html) |
| CommentBox.io | Code from 2021, policy still names Privacy Shield, US hosting | [privacy](https://commentbox.io/privacy), [npm](https://www.npmjs.com/package/commentbox.io) |
| Remarkbox | Email required, app and FAQ hosts returned 504 on three tries | [home](https://www.remarkbox.com/) |
| ReplyBox | Login with Google or Twitter, guests not mentioned | [home](https://getreplybox.com/) |
| HTML Comment Box | Vendor's page shows an ad slot, free widget unconfirmed | [site](https://www.htmlcommentbox.com/) |
| Talkyard | About €4 a month (inferred) for a forum product, DPA status unclear | [pricing](https://www.talkyard.io/pricing) |
| Remark42 | No pre-approval or captcha documented, so guest spam shows until deleted | [spam manual](https://github.com/umputun/remark42/blob/master/site/content/docs/manuals/spam/index.md) |
| Isso, Comentario | Server to patch, about $2.34 to $4.54 a month (my estimate), Comentario hosted is unavailable | [Isso](https://isso-comments.de/docs/guides/quickstart/), [Comentario](https://docs.comentario.app/en/getting-started/cloud/) |
| Garrul | Good features, but under six months old with one main committer | [repo](https://github.com/KingPin/Garrul) |
| Bluesky, Mastodon, webmentions | Commenter needs an account elsewhere, and each post needs a social post | [Aversa](https://davideaversa.it/blog/bluesky-comments/), [Bridgy](https://brid.gy/about) |
| Form-to-pull-request (no-comment) | Commenter data enters public git history, and the token expires yearly | [no-comment](https://github.com/antenore/no-comment) |

Be wary of comparison posts. A mid-2026 roundup still recommends Cusdis's free cloud tier ([example](https://merginit.com/blog/21062026-free-commenting-platforms-comparison)), and EchoThread's ["best commenting system" article](https://echothread.io/blog/best-commenting-system-for-static-sites) is vendor marketing.

## FastComments wins on commitment, and Hyvor wins on simplicity

**FastComments' case is cost shape and paperwork.** Flex is billed monthly with no yearly option, supports monthly spend caps and includes de-branding ([pricing](https://fastcomments.com/traffic-pricing)). At 1,000 page loads a month, usage is about $0.01 on top of the base. Its DPA is automatic, needs no signature, and names EU sub-processors: Hetzner, OVH, Wasabi, Akamai, Mailgun EU and Brevo ([DPA](https://eu.fastcomments.com/dpa)). The policy says raw commenter IPs are not stored, and that commenting uses one authentication cookie ([policy](https://fastcomments.com/privacy-policy)). Its docs repository was pushed the day before this research ([GitHub](https://github.com/FastComments/fastcomments-docs)).

**Its weaknesses are real.** The operator, WinrickLabs LLC, is not Data Privacy Framework certified and relies on SCCs, and the DPA counts remote administration from the US as a third-country transfer ([DPA](https://eu.fastcomments.com/dpa)). The default setup asks for an email, and comments auto-approve ([docs](https://docs.fastcomments.com/guide-moderation.html)). The sharpest guest problem is this line: "Usernames that a visitor types themselves still have to be unique" ([docs](https://docs.fastcomments.com/guide-customizations-and-configuration.html)). A second "Juan" could be refused, and the docs do not say whether uniqueness applies per site or across the service.

**Hyvor's case is that it needs less configuration.** Guests give a name and nothing else by default ([docs](https://hyvor.com/talk/docs/commenting)). The price is published and fixed, and the plan comfortably covers this traffic at 1 credit per embed load out of 2,500 a month ([pricing](https://hyvor.com/talk/pricing)). It promises no ads, affiliate links or tracking codes ([product](https://hyvor.com/talk)), and the team says it is dropping its newsletter product to focus on comments ([update](https://hyvor.com/blog/hyvor-quarterly-update-q2-2026)). Its costs are a year paid up front, likely Hyvor branding because de-branding appears only on the €40-a-month Business plan ([pricing](https://hyvor.com/talk/pricing)), and US sub-processors for CDN, email and errors, with Akismet as the default spam service ([list](https://hyvor.com/sub), [spam docs](https://talk.hyvor.com/docs/spam)).

**Hyvor's native click-to-load matters less than it looks.** `loading="manual"` delays the comments until `.load()` runs ([docs](https://hyvor.com/talk/docs/comments)), but a script tag in the page would still contact `talk.hyvor.com` on page load. My inference is that keeping today's privacy property needs the script injected on click, which is what the existing button already does for Disqus. FastComments has the opposite trap: its `useShowCommentsToggle` button is "not shown if there are no comments" ([docs](https://docs.fastcomments.com/guide-customizations-and-configuration.html)), which describes every post here. Do not use it. Keep your own button.

**Switch to Hyvor if any of three things happens in the trial:** the Flex bill turns out well above $1, the username rule refuses ordinary names and the workarounds feel wrong, or new-comment email to the owner proves unreliable. A generated or default username avoids the second problem, at the cost of commenter identity.

**GraphComment and Waline are fallbacks for a $0 budget.** GraphComment is free and French-operated, but its guest mode is confirmed only for WordPress, its [docs](https://developers.graphcomment.com/docs/getting-started) describe no on-demand load, and its free plan outside WordPress uses an iframe ([pricing](https://www.graphcomment.com/en/pricing)). Its GDPR page names Iguane Services in Paris as primary host ([GDPR page](https://developers.graphcomment.com/docs/gdpr-eu-data-residency)), while its later DPA names DigitalOcean in Amsterdam and turns on Mistral moderation by default ([DPA](https://www.graphcomment.com/en/dpa)). Both locations are in the EU, but the conflict needs an answer. Waline is the best self-hosted fit and the only one here you control. It also has the most setup: a built-in Akismet key, Libravatar, a default OAuth service ([env](https://github.com/walinejs/waline/blob/main/docs/src/en/reference/server/env.md)), unpkg-hosted assets ([props](https://waline.js.org/en/reference/client/props.html)) and a Vercel function region that defaults to the US ([regions](https://vercel.com/docs/functions/configuring-functions/region)). I found no export statement for it, though the database can be dumped.

## Zero comments argue for keeping the exit cheap

Disqus produced no real comments here, and the evidence does not show a better widget changes that. No source gives measured comment counts for small blogs under any approach. Practitioners report low use: one Bluesky-comments author says comments are rarely used on blogs and he gets few ([Aversa](https://davideaversa.it/blog/bluesky-comments/)), and another removed webmentions in 2026 as "not adding much value" while keeping email and Mastodon replies ([deepakness.com](https://deepakness.com/raw/removing-webmentions/)). Guest forms remove the account barrier, but I found no evidence that they raise volume.

**A `mailto:` line is the honest baseline.** It costs nothing, needs no JavaScript, third party or consent notice, and accepts guests ([de Vries](https://hidde.blog/reply-via-email) does this). I rank it below a comment system here only because you asked for a replacement, and its replies are not public. Add it next to the widget. My judgment: review the widget after 12 months, and remove it if it has collected no real comments. At this price, the test costs about $12.

Disqus import does not matter, since there is little to move. Export does. FastComments offers CSV from the dashboard and by API ([migrations](https://docs.fastcomments.com/guide-migrations.html)), which is enough to convert to static comments later. Cusdis shows why this comes first: its only export route is an email request to the project ([README](https://raw.githubusercontent.com/djyde/cusdis/master/README.md)).

## Everything below is unverified, and most of it closes with one test post

Most vendor pages were read through a page summariser. A few items were seen only as search snippets. I found no independent 2026 user report for any service. Labels: **P** is a vendor page, **S** is a search snippet or secondary source, **A** is my arithmetic or inference, and **None** means no source was found.

| Unverified item | Label | How to settle it |
|---|---|---|
| Click-then-inject works on FastComments, Hyvor or any other vendor | A | Try it on one post |
| Real requests and cookies from any embed, including FastComments' "first party" claim | P, no capture | Browser network tab, before and after the click |
| FastComments bill of about $1 a month, and what the $0.99 base covers | A | First invoice, with a spend cap set |
| VAT on either finalist's price | None | Checkout page |
| Scope of FastComments' unique-username rule | P, scope unstated | Post twice as "Juan" from different browsers |
| FastComments EU embed hostname (`cdn-eu` exists, snippet unread) | P, partial | EU account dashboard |
| Whether FastComments emails per comment or only sends digests | P, unclear | Post a test comment |
| How "spam detection on by default" differs from the Deep Infra classifier, which is off by default | A | Ask support or read the settings |
| FastComments data handling after cancellation | None | Ask support |
| Hyvor owner email for new comments (only a 2021 post confirms it) | P, dated | Post a test comment |
| Whether Hyvor's Akismet default can be turned off, and Hyvor's spam allowance at Personal | A | Console settings |
| Hyvor Personal branding, and whether monthly billing exists | A | Trial and pricing page |
| Hyvor's French operator: stated in the research notes with no source page | None | Hyvor legal page or invoice |
| Hyvor commenter data location (inferred from the Hetzner entry) | A | Ask <privacy@hyvor.com> |
| Hyvor token: local storage in the policy, "cookie" in a snippet. The policy dates from 2024 | P vs S | Browser storage inspector |
| Hyvor Disqus import and export formats | S | Console |
| GraphComment guest mode on a static page, branding, moderation queue | None or S | Test page |
| GraphComment primary host conflict | P vs P | Ask <dpo@semiologic.fr> |
| Completeness of Spanish strings on any service, including button text | P, locale presence only | View the widget in `es` |
| Remarkbox outage: one day's checks only, may be transient | Own test | Recheck only if it matters |
| Whether a consent banner is needed for any option | A, not legal advice | Your own decision, or a lawyer |
| Discourse embed (a built-in Minimal Mistakes provider), IntenseDebate, Vuukle (markets "Monetize"), Chirpy, Coral, Remarq, ziscus, comment-kit, StaticLayer | Not assessed | Evaluate only if the finalists and fallbacks all fail |

**The test should take about an hour, by my estimate.** FastComments has a 30-day trial and Hyvor a 14-day trial, both with no card ([FastComments](https://fastcomments.com/traffic-pricing), [Hyvor](https://hyvor.com/talk/pricing)). Sign up on `eu.fastcomments.com`, not the default domain, because global accounts replicate to regions including the US and Brazil ([policy](https://fastcomments.com/privacy-policy)). Enable anonymous mode, remove the email field, set `disableUnverifiedLabel`, and require manual approval for all comments ([docs](https://docs.fastcomments.com/guide-customizations-and-configuration.html)). With no email field, guests cannot verify, so every comment would otherwise carry an "Unverified Comment" label. Keep the optional auto-removal of unverified comments off, or guest comments get deleted. Leave AI features off, because Deep Infra (US) has no contract in place ([DPA](https://eu.fastcomments.com/dpa)).

**Three changes in the repo follow.** The notice in `_includes/comments-providers/custom.html` names Disqus, Google Fonts and an ad, so it needs rewriting, as does `/cookies/`. Name the new vendor and what it receives. The language needs a decision: `site.locale` is a global `en-GB`, and a quick grep found one post with a Spanish `lang` or `locale` field. FastComments follows the browser by default, which is acceptable and needs no work. A per-post `locale` needs that front matter on each post. Finally, keep the existing button, since it means no third-party request happens before the visitor acts.

## Conclusion

The research started as a search for the best commenting product and ended as a question of how little to commit. Hard constraints remove most of the market, including services still recommended in 2026 articles, and the two survivors differ by a few tens of euros a year. Pick the one you can leave in a month, and treat the first month as the evaluation, since no evidence here comes from a running embed.

The click-to-load button you built for Disqus is the most durable part of this setup. It limits third-party exposure under every option, so it reduces the risk of each unverified cookie claim above, and it makes the vendor replaceable with a small edit to one include.
