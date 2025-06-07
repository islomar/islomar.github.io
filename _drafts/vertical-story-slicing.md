---
title: "Vertical Slicing Listicle"
date: 2025-06-20T00:00:00+01:00
last_modified_at: 2025-06-20T00:00:00+01:00
lang: en
ref: vertical-slicing-listicle
categories:
  - blog
tags:
  - english
  - agile
  - product-management
  - story-slicing
  - vertical-slicing
---

Every time I arrive to a new company or team, one of the many tasks that I get myself doing is talking about **vertical slicing**, why it matters, techniques, etc. And then, I take a look for the n-th time to the resources I have saved in Notion, Drive or GitHub, and share them (because... well, you know, sharing is caring 😄).

The goal of this post, which I will continuously update, is to have in a single place the main resources that have found valuable related with "vertical slicing". Some people refer to it as "story slicing". Personally, I prefer thinking of "story slicing" as the generic term, where we can find "tastes" like "vertical slicing" or "horizontal slicing".

Although the goal of this post is not to explain what vertical slicing is and its benefits, I will do a quick and hypersimplified review of it:

- **What is slicing?**
  - I loved something I heard during a workshop with Kevin Meadows and Chris Pipito:
    - "Getting to the smallest possible thing we can have a conversation about. 'What can we do today, that can be used tomorrow?' That can make tomorrow easier for customers, for users or for us."
  - **Horizontal slicing**: 
    - "A horizontal slice tends to decompose problems into technical layers which may seem to match well with the technical skills of team members, i.e. they’re split amongst a database team, a UI team, and a server team each of which is responsible for their own tasks.
    Even though we may call these horizontal slices user stories, and create them in form of user stories, they are in fact can’t deliver the value to the end customer without interaction or integration with other layers, components, or other building blocks of the software system. It is like slicing a cake horizontally, which does not allow for users to have the perfect bite." (source: [User Story Splitting - Vertical Slice vs Horizontal Slice](https://www.visual-paradigm.com/scrum/user-story-splitting-vertical-slice-vs-horizontal-slice/))
  - **Vertical slicing**: xxx
- **Why do we "need" stories?**
  - Bridge business-technical communication
  - Focus on user value over tech specs
  - Enable iterative delivery & feedback
  - Support priorization (re-priorization)
  - Track progress - timelines & estimates

My personal opinion: in order to enable and get the benefits, you need some practices (XP and Lean), parallel changes techniques, continuous delivery/deployment, deferring commitment, simplicity, a design that enables (e.g. ports and adapters aka "hexagonal architecture" or some patterns from DDD), etc.

## Techniques

- [How to split a user story](https://www.humanizingwork.com/wp-content/uploads/2020/10/HW-Story-Splitting-Flowchart.pdf)
  - XXX
- [SPIDR – five simple techniques for a perfectly split user story](https://blogs.itemis.com/en/spidr-five-simple-techniques-for-a-perfectly-split-user-story) (6 min. read)
  - A technique by [Mike Cohn](https://www.mountaingoatsoftware.com/company/about-mike-cohn)
- [Splitting User Stories](https://www.agilelearninglabs.com/wp-content/uploads/2013/05/Splitting-User-Stories.pdf), from Agile Learning Labs
  - **Conjunctions**: look for connector words, e.g. and, or, if, when, but, etc.
  - **Generic words**: look for generic words that could be replaced with more specific terms
  - **Acceptance Criteria**
  - **Timeline Analysis**
- [Splitting user stories -- the hamburger method](https://gojko.net/2012/01/23/splitting-user-stories-the-hamburger-method/) by [Gojko Adzic](https://gojko.net/) (7 min. read)
  - I was lucky enough to attend in CraftConf 2016 his great "Specification by example" workshop (finally delivered by his partner)
  - [Hamburger technique to Split User Stories from Development team perspective](https://ancaonuta.medium.com/hamburger-method-to-split-user-stories-from-dev-team-perspective-d17aba58be02)
- [Effective story slicing](https://www.slideshare.net/slideshow/effective-story-slicing/31078074) by [Neil Killick](https://www.neilkillick.com/)
- [50 quick ideas to improve your user stories](https://www.goodreads.com/book/show/21411450-fifty-quick-ideas-to-improve-your-user-stories) by [Gojko Adzic](https://gojko.net/)
  - A highly recommended book with tones of great techniques and heuretics for getting better in vertical slicing.
  - Some examples mentioned:
    - Narrow down your user segment
    - Split by capacity
    - Start with dummy, then move to dynamic
    - Simplify outputs
    - Split learning from earning
    - Extract basic utility
    - When all else fails, slice the hamburger
      - User story mapping

## Workshops

- Elephant Carpaccio
  - Facilitation guide, etc.XXXXXX
- [Small Safe Steps workshop (parallel changes)](https://www.eferro.net/p/small-safe-steps-3s-workshop.html)
- [Story Slicing Workshop](https://www.linkedin.com/posts/jkmeadows_free-story-slicing-workshop-activity-7272369317571096576-uNyE/)
  - Event facilitated by [Chris Pipito](https://teamingwithsasquatch.com/) & [Kevin Meadows](https://www.linkedin.com/in/jkmeadows/)
  - Amazing one, lucky to attend. They offer it among their services, I xxxx (disclaimer: I get no benefits from it, besides spreading happiness 😅)
  - <https://www.tickettailor.com/events/chrispipito/1521015>
  - Connector Types Reference:
    - **Coordinating Conjunctions**: and, or, but, yet, nor, etc.
    - **Action-Related Connectors**: manage, handle, support, process, maintain, administer, etc.
    - **Sequence Connectors**: before, after, hen, while, during, when, etc.
    - **Scope Indicators**: including, as-well-as, along with, also, additionally, plus, with, etc.
    - **Option Indicator**: either/or, whether, alternatively, optionally, etc.
    - **Exceptions Indicators**: except, unless, however, although, despite, etc.
  - "After slicing, can we pick one slice that is small enough to build today for use tomorrow?"

## Related interesting readings

- [Developing Software: Postponing Decisions and Working in Small Steps](https://www.eferro.net/2025/01/developing-software-postponing.html) by Edu Ferro (17 min. read)
- [MMMSS: Many More Much Smaller Steps](https://www.geepawhill.org/series/many-more-much-smaller-steps/), a great series of articles by Geepaw Hil
- [Think About How You Organize Your Work](https://docs.google.com/document/d/1bXAGIueSCZiclhVD_uNph4BzO47EHpkw/edit), by Don Reinertsen (4 min. read)
- [Lean Software development: The art of postponing decisions](https://www.eferro.net/2022/08/software-development-art-of-postponing.html) by Edu Ferro (9 min. read)
- [Five common story mapping mistakes](https://jpattonassociates.com/5-story-mapping-mistakes/) by Jeff Patton (8 min. read)
- [Software economics](https://leanpub.com/software-economics) by Luis Artola (only in Spanish)
- [Return of the horizontal slice](https://www.industriallogic.com/blog/return-of-the-horizontal-slice/) by Joshua Kerievsky (4 min. read)
- [User Story Splitting - Vertical Slice vs Horizontal Slice](https://www.visual-paradigm.com/scrum/user-story-splitting-vertical-slice-vs-horizontal-slice/) (7 min. read)

## Related interesting topics

- Hamburger method
- User Story Mapping
- INVEST stories
- Opportunity cost
- Cost of Delay, CD3
- Technical slicing
- Impact mapping
- Domain storytelling
- Event storming

## TODO

- <https://agileotter.blogspot.com/2025/02/pair-programming-listicle.html>
