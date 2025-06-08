---
title: "Vertical Slicing Listicle"
date: 2025-06-08T19:41:41+02:00
last_modified_at: 2025-06-08T19:41:41+02:00
toc: true
toc_label: "Table of Contents"
toc_icon: "chalkboard-teacher"
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

Every time I arrive to a new company or team, one of the first things that I get myself doing is talking about **vertical slicing**: why it matters, techniques, workshops, etc. And then, I take a look for the n-th time to the resources I have saved in Notion, Drive, GitHub, or my hard-drive (distributed systems have their drawbacks 🤣), in order to share them (because... well, you know, sharing is caring 😄).

The goal of this post, which I will update whenever I discover more interesting resources, is to have in a single place the main resources that have found valuable related with "vertical slicing". Some people refer to it as **story slicing** or **vertical story slicing**: all sounds great to me. Personally, I prefer thinking of "story slicing" as the generic term, where we can find "tastes" like "vertical slicing" or "horizontal slicing".

As usual: this post is for my future me, but I decided to share it in case it might be found useful for someone else 🙏

Although the goal of this post is not to explain what vertical slicing is and its benefits, I will do a quick and hypersimplified review of it:

## What is slicing?

- I love something I heard during a workshop with [Kevin Meadows](https://sessionize.com/kevin-meadows) and [Chris Pipito](https://chrispipito.com/):
  - **"Getting to the smallest possible thing we can have a conversation about. 'What can we do today, that can be used tomorrow?' That can make tomorrow easier for customers, for users or for us."**
- **Horizontal slicing** (PLEASE, AVOID IT 🙃):
  - "A horizontal slice tends to decompose problems into technical layers which may seem to match well with the technical skills of team members, i.e. they’re split amongst a database team, a UI team, and a server team each of which is responsible for their own tasks.
  Even though we may call these horizontal slices user stories, and create them in form of user stories, they are in fact can’t deliver the value to the end customer without interaction or integration with other layers, components, or other building blocks of the software system. It is like slicing a cake horizontally, which does not allow for users to have the perfect bite." (source: [User Story Splitting - Vertical Slice vs Horizontal Slice](https://www.visual-paradigm.com/scrum/user-story-splitting-vertical-slice-vs-horizontal-slice/))
- **Vertical slicing**:
  - Vertical slicing is a technique in agile product and software development where work is broken down into **small**, **end-to-end** increments that **deliver value** across **all layers** of the system—UI, backend, database, etc. Each "slice" represents a complete, functional piece of the product, allowing teams to build, test, and deliver working software **iteratively** and get **early feedback**.

<div style="display: flex;
            align-items: stretch;
            justify-content: center;
            gap: 1em;
            margin: 2em 0;">
  <figure style="display: flex;
                 flex-direction: column;
                 justify-content: space-between;
                 margin: 0;
                 text-align: center;
                 width: 50%;">
    <img src="{{ '/assets/images/vertical_slicing_1.png' | relative_url }}"
         alt="Is this the alt??"
         style="max-width:100%; height:auto;">
    <figcaption style="width: 100%; text-align: center; margin: 0;">
      <em>(from <a href="https://www.gianty.com/vertical-slice-game-development/"
         target="_blank" rel="noopener">
        Gianty
      </a>)</em>
    </figcaption>
  </figure>

  <figure style="display: flex;
                 flex-direction: column;
                 justify-content: space-between;
                 margin: 0;
                 text-align: center;
                 width: 30%;">
    <!-- here we add margin-top to push it down -->
    <img src="{{ '/assets/images/vertical_slicing_2.png' | relative_url }}"
         alt="A cake slice showing several horizontal slices with a cherry on top"
         style="max-width:100%; height:auto; margin-top:3em;">
    <figcaption style="width: 100%; text-align: center; margin: 0;">
      <em>(from <a href="https://www.visual-paradigm.com/scrum/user-story-splitting-vertical-slice-vs-horizontal-slice/"
         target="_blank" rel="noopener">
        Visual Paradigm
      </a>)</em>
    </figcaption>
  </figure>
</div>

## Why do we "need" stories?

- Bridge **business-technical communication**
- Focus on **user value** over tech specs
- Enable **iterative and incremental delivery & feedback**
- Support **prioritization** (and re-prioritization)
- Track progress

My personal opinion: in order to enable and get its benefits, you need some principles and practices (e.g. from XP and Lean), e.g. parallel changes techniques, continuous delivery/deployment, deferring commitment, simplicity, a design that enables it (e.g. ports and adapters aka "hexagonal architecture" or some patterns from DDD), etc.

## Some techniques

- [How to split a user story](https://www.humanizingwork.com/wp-content/uploads/2020/10/HW-Story-Splitting-Flowchart.pdf). For example:
  - Workflow steps
  - Defer performance
  - Simple/complex
  - Operations
  - Interface variations
  - Business rule variations
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
  - A highly recommended book with tones of great techniques and heuristics for getting better in vertical slicing.
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

- [Elephant Carpaccio (by Alistair Cockburn)](https://alistaircockburn.com/Elephant-Carpaccio)
  - [Facilitation guide (by Henrik Kniberg)](https://blog.crisp.se/2013/07/25/henrikkniberg/elephant-carpaccio-facilitation-guide)
- [Small Safe Steps workshop (parallel changes)](https://www.eferro.net/p/small-safe-steps-3s-workshop.html)
- [Story Slicing Workshop](https://www.linkedin.com/posts/jkmeadows_free-story-slicing-workshop-activity-7272369317571096576-uNyE/)
  - Event facilitated by [Chris Pipito](https://teamingwithsasquatch.com/) & [Kevin Meadows](https://www.linkedin.com/in/jkmeadows/)
  - Amazing one, I was really lucky to be able to attend it some time ago. They offer it among their services, I wouldn't doubt to purchase it (disclaimer: I get no benefits from it, besides spreading happiness 😅)
  - <https://www.tickettailor.com/events/chrispipito/1521015>
  - Connector Types Reference:
    - **Coordinating Conjunctions**: and, or, but, yet, nor, etc.
    - **Action-Related Connectors**: manage, handle, support, process, maintain, administer, etc.
    - **Sequence Connectors**: before, after, hen, while, during, when, etc.
    - **Scope Indicators**: including, as-well-as, along with, also, additionally, plus, with, etc.
    - **Option Indicator**: either/or, whether, alternatively, optionally, etc.
    - **Exceptions Indicators**: except, unless, however, although, despite, etc.
  - ***"After slicing, can we pick one slice that is small enough to build today for use tomorrow?"***

## Related interesting resources

- [Developing Software: Postponing Decisions and Working in Small Steps](https://www.eferro.net/2025/01/developing-software-postponing.html) by Edu Ferro (17 min. read)
- [MMMSS: Many More Much Smaller Steps](https://www.geepawhill.org/series/many-more-much-smaller-steps/), a great series of articles by Geepaw Hil
- [Think About How You Organize Your Work](https://docs.google.com/document/d/1bXAGIueSCZiclhVD_uNph4BzO47EHpkw/edit), by Don Reinertsen (4 min. read)
- [Lean Software development: The art of postponing decisions](https://www.eferro.net/2022/08/software-development-art-of-postponing.html) by Edu Ferro (9 min. read)
- [Five common story mapping mistakes](https://jpattonassociates.com/5-story-mapping-mistakes/) by Jeff Patton (8 min. read)
- [Software economics](https://leanpub.com/software-economics) by Luis Artola (only in Spanish)
- [Return of the horizontal slice](https://www.industriallogic.com/blog/return-of-the-horizontal-slice/) by Joshua Kerievsky (4 min. read)
- [User Story Splitting - Vertical Slice vs Horizontal Slice](https://www.visual-paradigm.com/scrum/user-story-splitting-vertical-slice-vs-horizontal-slice/) (7 min. read)
- [Vertical Story Slicing](https://www.youtube.com/watch?v=ajYN66GCpf8) (video, 53 min.)

## Further interesting topics, tools, and techniques

- [Hamburger method](https://gojko.net/2012/01/23/splitting-user-stories-the-hamburger-method/)
- [User Story Mapping](https://jpattonassociates.com/story-mapping/)
- [INVEST](https://en.wikipedia.org/wiki/INVEST_(mnemonic))
- [Impact mapping](https://www.impactmapping.org/)
- [Value stream mapping](https://en.wikipedia.org/wiki/Value-stream_mapping)
  - [Great book here](https://www.goodreads.com/book/show/17718225-value-stream-mapping)
- [User journeys](https://www.nngroup.com/articles/user-journeys-vs-user-flows/)
- [Domain storytelling](http://www.domainstorytelling.org/)
- [Event storming](https://www.eventstorming.com/)
- [Jobs-to-be-Done framework (JTBD)](https://jobstobedone.org/)
- [Opportunity cost](https://en.wikipedia.org/wiki/Opportunity_cost)
- [Cost of Delay and CD3](https://blackswanfarming.com/cost-of-delay-divided-by-duration/)
- Technical slicing
  - [Parallel changes](https://martinfowler.com/bliki/ParallelChange.html)
  - [Story slicing – Technical](https://iadb.notion.site/Story-slicing-Technical-0db4467761e842a883b4b80462b7c01d)
- [Ports & Adapters, aka "Hexagonal Architecture"](https://alistair.cockburn.us/hexagonal-architecture)

Feel free to suggest other resources that you have found helpful, insightful, or illuminating!! 😊🙏
