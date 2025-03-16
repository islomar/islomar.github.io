---
title: "Questions and answers from my talk at the BilboStack 2024 conference"
date: 2025-03-16T16:26:27+01:00
last_modified_at: 2025-03-16T16:26:27+01:00
lang: en
ref: questions-and-answers-bilbostack-2024
categories:
  - blog
  - talks
tags:
  - talks
  - bilbostack24
  - english
---

> This is the **English version** for [the post I wrote in March 2024](/preguntas-y-respuestas-bilbostack-2024) answering several highly interesting questions related to my talk at the BilboStack conference about **Continuous Deployment** (including a lot of product-mindset, eXtreme Programming, and Lean Product Development values, principles and practices).

> There were questions related with code freezes, teams in distributed timezones, painful experiences with Git Hooks, async PRs, pairing, parallel changes techniques, technical debt, outside-in TDD, how to deal with deployment coupling between front-back, achieving ISO 27001/SOC2 certifications while practicing continuous deployment, etc.


# Questions and Answers from My Talk at BilboStack 2024

When at the wonderful [BilboStack](https://bilbostack.com/){:target="_blank"}{:rel="noopener noreferrer"} I finished [my talk on Continuous Deployment](/slides-and-resources-talk-bilbostack-2024) (I’ll never tire of repeating that it was just an excuse to talk about “what really matters”, which is the ability to deliver value in a continuous and sustainable way, while enjoying the journey), I was informed that there were no questions 😱  
In my experience, when that happens it means the level of craziness was astronomical and the message didn’t land at all 😅

Luckily, it seems the explanation was less dramatic: there was some problem with the application that collected the questions (was a test missing? 😜). The organizers were kind enough to send them to me _afterwards_, so I’ll try to answer them in this post.

**Important clarification**: I lack a lot of context in almost every question; I would need to understand many things better before giving a “reasonable” answer. I’ll make this explicit in some responses and infer it in others 🙏

---------------------------

1. **Can you explain how to achieve ISO 27001/SOC2 while working in continuous delivery?**  
   - **Summary:** Not really 🤣 But I can share a few tidbits that might help somewhat...  
   - One thing I mentioned the other day while talking with someone about this topic is that we tend to take too many things for granted. The very first thing we must always do is to **UNDERSTAND** in depth the needs to be met. I think there is a lot of “broken telephone” at play and we infer that many things are needed that are actually potential solutions (e.g. having a PR) rather than the underlying need to be solved (e.g. that more than one person has reviewed something).  
   - That said: I know that the auditor you get can influence things a lot.  
   - At a much higher level, Clarity published a post about this: ["ISO27001 and SOC2 Type II from Greenfield to Success"](https://medium.com/clarityai-engineering/iso27001-and-soc2-type-ii-from-greenfield-to-success-24ca99decb26)  
   - In my team we actually practiced “Continuous Deployment” and in our case it was enough to follow these requirements:
     * Each commit included the **Jira issue** that originated it – generating an unequivocal trace to the need that gave rise to that code.
     * Since we worked in pairing or ensemble programming by default, every commit included all the people involved by using Git’s **["Co-authored-by" feature](https://docs.github.com/es/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors)**  
       - To reduce friction, we all had a shared **[git message template](https://gist.github.com/lisawolderiksen/a7b99d94c92c6671181611be1641c733)** with the rest of our team members, so we didn’t have to keep writing it.
       - As far as I know, and simplifying a lot, one of the things required is **evidence** that someone other than the code’s author has reviewed it. This practice satisfied that need.
     * If the change to be made was “very trivial” (which is always abstract, but we had a document defining it), it was allowed that no reviewer existed (e.g. a change in documentation). In these cases, it was enough to include in the commit message a certain keyword (in our specific case, `[trivial-small-change]`).
   - For people working with branches and PRs/MRs, the person who validated the PR had to be different from the one who opened it.
   - If you need more detail, perhaps [Edu Ferro](https://www.eferro.net/) can tell you more things 🙏

1. **What do you think of code freezes? Do they make sense in certain cases? For example, a large company with teams distributed across different time zones.**  
   - Questions that come to mind:
     - Are we talking about distributed teams or distributed systems? Or both?
     - When we talk about distributed teams, is it on an individual level or at the team level? Are all members of the same team in very different time zones? Or is the dispersion at the team level? (That is, members of the same team in a similar time zone, but each team in very different time zones)
   - Although I believe everything can make sense in some context, in general “code freezes” (especially if they occur relatively frequently) are a bad symptom. The mere fact of being a large company with teams distributed across different time zones does not imply that those code freezes should exist. Each team should have end-to-end ownership of a “value stream” (see the ["stream-aligned teams" of Team Topologies](https://martinfowler.com/bliki/TeamTopologies.html)).
   - Here Conway’s Law (and its reverse) comes into play, and one must be very careful with how teams, systems, and their responsibilities are designed.
   - Something that can also help is the existence of ["Team APIs"](https://medium.com/agile-outside-the-box/team-apis-af2dbc1805e7).
   - Depending on the degree of overlapping hours, “core” hours can be set for pairing/ensemble work.
   - If we talk about distributed individuals: a branching strategy like ["Ship, Show, Ask"](https://martinfowler.com/articles/ship-show-ask.html) might be interesting.
   - If what we’re discussing is a distributed system and not only distributed teams (which is not the same), then it is essential to perform very good ["Contract Testing"](https://martinfowler.com/bliki/ContractTest.html): each system/service should be functionally testable in isolation without depending on the rest. This is independent of having additional end-to-end tests (which, in complex distributed systems, becomes quite complicated).

1. **Thanks for the talk! In your opinion, what would be a good branching strategy? Currently, having baby-commits and merging into the main branch, we opt for squash and merge, which creates a new commit and loses the trace of the old commits, leading to a commit hell when reviewing PRs. They usually ask us to try to make a single commit per feature and then merge (not fast-forward) and I manage that with git --amend.**  
   - My first answer: “it depends” 😜  
   - My second answer: the branching strategy that generally allows for fast feedback and a continuous, sustainable value contribution is “Trunk-Based Development” with a single default branch (accompanied, as I mentioned in the talk, by pair/ensemble programming, TDD, a secure, repeatable, and powerful pipeline, micro-commits, etc.).
   - Personally, I prioritize the continuous flow and getting the commit to Production as soon as possible over having an “immaculate” commit history. What is always important is that the commits are descriptive and clearly state the “why” above all (“the what” is implicit in the commit).
   - In line with what you mentioned, the good folks at [Codely](https://codely.com/) recorded a video a couple of years ago with their opinions on the matter. I think it might interest you if you can’t work with a single branch. I highly recommend it: ["Git Merge vs Rebase vs Squash: Which strategy should we choose?"](https://www.youtube.com/watch?v=HlmZLXMOpEM)

1. **What are the advantages and disadvantages of having tests in a Git hook?**  
   - **Clarification:** Everything you put in Git hooks must be “fast.” What “fast” means depends on the sensitivity of each person or team, but in my experience any execution that exceeds 5 seconds starts to “hurt” (pushes can take a little longer because we run them less frequently, but not much longer). In any case, and in my opinion, it’s better to wait “a little” at the time of commit-push than to face too many “surprises” later (a context switch problem). Also, in my opinion, it is wise to balance what is included in the pre-commit and what in the pre-push (see [examples in the diagrams with real cases from the talk](./2024-01-29-slides-and-resources-talk-bilbostack-2024.md)).
   - _Advantages:_ You get much faster feedback if tests fail (you don’t have to wait for them to fail in the pipeline when you’ve already switched focus and are halfway through something else). Of course, I wouldn’t include the slower tests, but only the “fast” ones (in my opinion all unit tests should be fast, as well as some integration tests – what I consider “unit” or “integration” could be a post on its own).
   - _Disadvantages:_ The problem arises if their execution is “too slow”; what will eventually happen is that we’ll skip them or accumulate too many changes. The solution is to have only the fastest tests or those that do not cause too much slowdown in the Git hooks. Parallelizing their execution as much as possible is important to reduce times.

1. **At first glance, very interesting. As a question: didn’t you notice that pre-commit and pre-push hooks could add friction and latency in the commit process, leading the team to make larger commits to avoid running linting, tests, etc. multiple times?**  
   - Very good question, and unfortunately it is not uncommon for that to happen. One must be very alert about it. I tried to address it in the previous question ☝️🙏

1. **Synchronous validations or asynchronous PR validations?**  
   - I’m not sure I understand this question, sorry. What do you mean by “validations”? Are we talking about tests? Linters? Or code review?
   - In line with what I mentioned in the talk: we must try to get feedback as fast and as frequently as possible for everything. As much as possible, I would prioritize synchronous code reviews; and even better: do as much pairing/ensemble work as possible.
   - I would also recommend taking a look at the branching strategy ["Ship, Show, Ask"](https://martinfowler.com/articles/ship-show-ask.html), which might be interesting as a step toward reducing integration times.

1. **When the “vicious cycle” you showed at the beginning becomes so large, how do you get out of it?**  
   - Uuufffff, a difficult question (or rather, a difficult answer 😅). The first necessary step is to have a general awareness of the problem and its nature (I would say that this is the hardest part). Making it visible and explicit, with data, always helps (for example, measuring the time from when we make a commit until it reaches Production), putting it in black and white.
   - The next important step is to really want to invest time in solving it, to clearly see the benefit that solving it can bring (which again is very difficult if it hasn’t been experienced before).
   - If all of the above is met: take it slowly. First, identify any “quick wins” that may exist (low cost and high benefit). Improve automated testing. Gradually reduce branch/PR times as much as possible. Adopt branching strategies that decrease the time it takes to integrate into the main branch. Increase and improve collaboration (e.g., through pairing). Learn techniques for parallel changes and start using “feature flags.”

1. **How can you showcase the contribution of CI/CD and overcome developers’ fear of deploying things early?**  
   - In my experience, the best way I’ve seen is to lead by example (which requires experience doing so), while also providing a lot of education about the value it brings to everyone, both business and engineering. I don’t think there are shortcuts or magic formulas... 😕 Of course, that “deploying things early” must be accompanied by a robust safety net; otherwise, the remedy will be worse than the disease, and understandably people won’t want to do it.

1. **Do you use pairing strategies like ping-pong? In these cases, wouldn’t the use of Git hooks be annoying?**  
   - In the past, I have done pairing with TDD using ping-pong (I’d say I have done pairing in almost every possible mode 🤣).
   - When I did ping-pong (Person A writes the test, Person B makes it pass, refactors, then Person B writes the next test, etc.) we did it by sharing the terminal (that is, both people really worked on the same machine, using [tmate](https://tmate.io/)). This implies that we did not commit until the test was green (and therefore Git hooks were not a problem).
   - One thing I would never do, regardless of Git hooks, is push code to the main branch without tests.
   - There are people who use [this tool](https://github.com/remotemobprogramming/mob) which might cover certain use cases (personally, I prefer not doing ping-pong and simply rotate by pomodoro, which is enough).
   - On the topic of pairing, this post is really good: [On Pair Programming](https://martinfowler.com/articles/on-pair-programming.html)

1. **Can having too many micro-commits “dirty” the main branch?**  
    - It depends on what is meant by “dirty.” What is always important is that commits have good messages, clearly describing the “why,” and of course no commit should break the tests.
    - That said, I believe it is more important to take small steps and have continuous feedback and flow than to maintain a supposedly “ideal” commit history.

1. **Generally, it is required that a feature be complete before being pushed and they don’t want to see anything until it’s finished. Would trunk-based development be applicable?**  
    - Absolutely. To resolve the problem you describe, which is very common, there are multiple techniques for parallel changes ([I included some information on this](https://islomar.es/blog/talks/slides-and-resources-talk-bilbostack-2024/#parallel-changes)) and, above all, the use of [feature flags/toggles](https://martinfowler.com/articles/feature-toggles.html).
    - This is related to the decoupling I mentioned during the talk between “Deployment” (a technical decision) and “Release” (a business decision).

1. **For using CD with trunk-based development, when making commits and pushing them, did you have any configuration to prevent commits that don’t pass tests?**  
    - Yes, we had Git hooks configured for both pre-commit and pre-push. In the [diagrams from the slides of the talk](/slides-and-resources-talk-bilbostack-2024) you can see what we included in each.

1. **To the question someone asked: "It’s to change the world, because to a greater or lesser extent when we push a change, it changes the lives of some people (for better or for worse) – our users or clients, because they have tools to do their work better."**  
    - I understand this is the answer to the question I posed: “Why do we develop software professionally?” I find this perspective wonderful, truly—I feel very aligned with the idea underlying it.
    - Regarding the nuance I mentioned in my answer that I wanted to highlight, I would say: what if you could change/improve the world more optimally/efficiently **WITHOUT** software—wouldn’t you do it? 😉

1. **Do you think it makes sense to run several CI processes in parallel? For example, unit tests, building the build, and e2e tests at the same time?**  
    - Yes, but it depends on which ones. Without a doubt, **we must parallelize everything possible**, starting with the tests themselves (almost all testing libraries allow parallel execution); additionally, it forces us to write “self-contained” tests whose input or output does not depend on other tests (which is by default what is most recommended). There should be no issue with unit and integration tests. With e2e/acceptance tests it might be different (it’s worth differentiating which ones can be parallelized and doing so).
    - In the [two real-life examples I included](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=44) you can see what we parallelized and what we didn’t; I’d say almost everything was done with great awareness (and always improvable) 😊
    - For example, regarding the second pipeline, I can explain why we didn’t parallelize those three tasks in particular:
      - We did not want to invest time in building the Docker image (and subsequently pushing it to an ECR) if the tests didn’t pass first.
      - Unit tests are the fastest and the most blocking: we don’t want to do anything else if they fail (another reason not to parallelize them with some other tasks). We can parallelize them with other equally fast tasks, such as linters and other static validations.
      - As for e2e tests: in our testing taxonomy, these are tests we run against the new version of the system already deployed somewhere (staging or production), so we couldn’t parallelize them with the build or unit tests either.
      - The tests we did parallelize as the first step in the pipeline were the **unit tests** (which follow the [FIRST principles](https://github.com/tekguard/Principles-of-Unit-Testing){:target="_blank"}{:rel="noopener noreferrer"}), **integration tests** (in our case tests for the secondary adapters of [our hexagonal architecture](https://herbertograca.com/2017/09/14/ports-adapters-architecture/){:target="_blank"}{:rel="noopener noreferrer"}), and acceptance tests (which are tests “from the outside” run against the system that includes the updates, brought up “locally” before being deployed).

1. **When doing TDD outside-in, you first write tests from the user’s perspective but then, do you continue with more internal tests?**  
    - Exactly, that’s the idea. It’s similar to [Acceptance TDD](https://www.agilealliance.org/glossary/atdd/), [Specification by Example](https://gojko.net/books/specification-by-example/){:target="_blank"}{:rel="noopener noreferrer"}, or [Behaviour-Driven Development (BDD)](https://dannorth.net/introducing-bdd/){:target="_blank"}{:rel="noopener noreferrer"} (there are nuances among the three, but in all cases we seek to test the system’s behavior from the perspective of its external user).
    - I would say that perhaps it is not always possible (I don’t always manage it), but it should be the primary approach: when done that way, the development experience is fantastic (and of course so is the user experience) 😍

1. **Do you consider it indispensable that continuous delivery always goes all the way to production? Wouldn’t it be enough with a Test environment that is a replica of Production to avoid risks?**  
    - We must not confuse “Continuous Delivery” with “Continuous Deployment.” In the first part of my talk I tried to explain [the differences](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=16){:target="_blank"}{:rel="noopener noreferrer"}.
    - With **“Continuous Delivery”**, indeed the pipeline does not deploy to Production. It may, for example, stop at a pre-production environment (e.g. Staging). The important thing is that once our code is integrated into the main branch and the build and automated tests have run, it remains in a “deployable state”: whenever we want, we could deploy it to Production (and that deployment should be simple and repeatable).
    - With **“Continuous Deployment”**, on the other hand, the entire pipeline is completely automated, including the step of deploying to Production.
    - In the first pipeline example I mentioned, we had Continuous Deployment but we still deployed first to a Staging environment: after deploying there, several e2e and smoke tests ran automatically and, if everything worked correctly, it was automatically deployed to Production.

1. **Understanding that a release is a business concept rather than a technological one, why is taking _product delivery lead time_ as a metric important? Isn’t that something outside of technology’s control?**  
    - Good question. My answer: because it is fundamental to see it as a “whole.” From the perspective of engineering/technology, we must understand that technology is a means to an end.
    - To me, it is one of the keys to evolving toward “product engineering”: understanding that ALL of us are part of the product and the business, and that what we do must meet user needs.
    - In reality, from an engineering perspective we can and should influence the “product delivery lead time” much more than we think. I have often seen product managers’ vision change (for the better) when developers bring to the table simpler ways to start satisfying user needs.
    - Obviously, the appropriate company culture is needed for this to occur so that we do not end up with isolated silos where “business” and “technology” are completely separated: we must move toward understanding that **we are all the PRODUCT** and need to collaborate continuously and intensively.

1. **When always working on the same branch, if you push to the server and something fails, as part of that rollback is a commit with a revert automatically generated? Or would the main branch be blocked?**  
    - First, let’s do what we can in each context, which is already a lot 😄  
    - In the [second real-world example](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=45){:target="_blank"}{:rel="noopener noreferrer"} that I shared in the talk, it was a very quick rollback of the deployment, so no commit was generated. To give more technical details, we did the [rollback with helm](https://helm.sh/docs/helm/helm_rollback/){:target="_blank"}{:rel="noopener noreferrer"} (which was also what we used for deployment).
    - When that happened, we received a message in the team Slack channel for important issues (e.g. any pipeline failure).
    - The automatic rollback in Production gave us the peace of mind of knowing that the system remained in a stable state, with the previous version still functioning.
    - Once we finished the pomodoro that was in progress (we primarily work in _ensemble_), we immediately prioritized checking what had failed and resolving it. There was no “blockage” of the main branch because we worked in _ensemble_. But if that were not the case—as I mentioned in the talk—fixing a broken pipeline must be **PRIORITY**, meaning it isn’t that the branch stays blocked; it must be fixed immediately, and everyone on the team, regardless of who made the commit that broke it, works together (I believe that a change in mindset is important, and working in isolation and very individually doesn’t help).
    - Working in a single branch with lead times of minutes, there was no need for the concept of a “hot fix”: after the automatic rollback, we fixed the issue as soon as possible (within a few minutes) and committed the fix (with an automated test included to avoid recurrence, if possible) and then moved on 😉
    - Part of the philosophy here is that when there is an incident in Production, the first and most important thing is to get Production back up and running as soon as possible—whether by reverting to the previous version or by quickly committing a solution.
    - Over two years, there have been very few occasions when such a rollback occurred (we had a very strong safety net in place). We must not get used to it happening all the time; that would be a symptom of needing to invest in improving the safety net.

1. **Thanks for the great talk, you rock! I love your point about discipline and especially about the bottleneck focused on knowledge! I have a question: This world has evolved with terms like CI/CD and others such as DevOps, DevSecOps. What do you think about this? Who should have this responsibility, an individual or a team? I’d love to know your perspective.**  
    - Thanks! Well, [in my opinion](https://www.youtube.com/watch?v=GYtzu_G4A4M) with DevOps we have reached a situation of ["semantic inversion"](https://martinfowler.com/bliki/SemanticDiffusion.html): it ended up meaning exactly the opposite of what was intended. The goal was to improve collaboration and break down silos of knowledge, blockers, and hot potato handoffs, but in general it ended up with “DevOps teams” (essentially a renaming of the “systems team”) that continue to maintain silos, blocking dependencies, etc. _</rant>_
    - [DevOps](https://martinfowler.com/bliki/DevOpsCulture.html) is a culture, not a team. This is not incompatible with having, for example, [platform or enabler teams that make life easier for the "stream-aligned teams"](https://martinfowler.com/bliki/TeamTopologies.html) through various self-service tools and services. But teams—say, “external product teams”—should not have blocking dependencies on those teams.
    - The same applies to DevSecOps: as much as possible it should be integrated into the deployment/delivery pipeline, probably supported by services/tools from other teams.

1. **Do you think the trunk/CI approach is valid for addressing technical debt or for sustaining tasks like upgrading versions of frameworks or libraries? Or is it something exclusive to product delivery?**  
    - Absolutely, I believe that TBD/CI can be applied in multiple contexts.
    - In fact, I think the best way to address **[technical debt](https://martinfowler.com/bliki/TechnicalDebt.html){:target="_blank"}{:rel="noopener noreferrer"}** (which, by the way, we need to be sure we are talking about the same thing 😄) is gradually. Running “technical debt sprints” is usually a symptom of a lack of “slack” in the team (among other things).
    - Regarding framework/library updates: here I’d say it depends.
      - For library updates, I’d say yes (in my team we used [renovatebot](https://github.com/renovatebot/renovate){:target="_blank"}{:rel="noopener noreferrer"} to automatically update all libraries on a daily basis, and the pipeline still deployed at the end). But again, I repeat: you need a very robust safety net, especially very good automated tests.
      - As for framework updates: it depends on the implications of the change. Normally yes, but when they are _major_ versions, it is not unlikely that the impact is significant enough to require doing it in a branch that lives for more than 24 hours so you can change and test everything calmly.

1. **Do you have any suggestions or techniques for running E2E tests in Production? For example, synthetic traffic, traffic mirroring, etc.?**  
    - Interesting question 😄 The answer is: “it depends on the context” (sorry, not sorry). To share a couple of very different cases I’ve encountered (among many others):
      - **At [Clarity AI](https://clarity.ai/){:target="_blank"}{:rel="noopener noreferrer"}:**
        - See the [second real-life pipeline example](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=45){:target="_blank"}{:rel="noopener noreferrer"} that I shared.
        - There we had several e2e tests (those that mimic a real user): some using [Cypress](https://www.cypress.io/){:target="_blank"}{:rel="noopener noreferrer"} (the main service was a [Slack app (with a slash command)](https://api.slack.com/interactivity/slash-commands){:target="_blank"}{:rel="noopener noreferrer"}, so these tests actually accessed Slack from a browser and executed various commands) and some in pure Python (making HTTP requests to some endpoints that we also published).
        - The services/applications deployed there were all for internal use by Clarity employees (about 300 at the time), mainly in Engineering.
        - For all the above, in our specific case scalability wasn’t an issue: we didn’t have hundreds, thousands, or millions of concurrent users. Therefore, we didn’t need load or stress tests, and the e2e tests we had didn’t require anything special.
      - **At [Form3](https://form3.tech/){:target="_blank"}{:rel="noopener noreferrer"}:**
        - Here things change: for several months I was on the (micro) scalability team, whose main responsibility was detecting (and sometimes fixing) bottlenecks in the scalability of our (not simple) distributed system.
        - To say that Form3’s product was (or is) an [HTTP API](https://www.api-docs.form3.tech/){:target="_blank"}{:rel="noopener noreferrer"} in fintech is an understatement. We handled a lot of money daily and it was quite critical (no one died, but it was no laughing matter 🤣).
        - Something very interesting is that we worked hand in hand with the Sales team to generate simulated traffic based on the “real” forecast of new users (e.g., if X contracts had been signed for a certain date, implying N new clients/users).
        - The load and stress e2e tests were run with [k6.io](https://k6.io/){:target="_blank"}{:rel="noopener noreferrer"} (in fact, Form3 eventually released an [open-source solution called ‘f1’](https://github.com/form3tech-oss/f1){:target="_blank"}{:rel="noopener noreferrer"} that simplified this based on the work we did on my team; it’s very interesting, I recommend checking it out). We created an hourly distribution of requests similar to what we usually had, with Gaussian distributions but with the estimated volumes.
        - It’s something that, honestly, I had not seen done before, nor have I seen it done again 🤯

1. **How can you balance huge test suites that slow down pipelines with the speed required in trunk-based development?**  
    - To clarify, in Trunk-Based Development (TBD) or CI that “speed” isn’t as critical in my opinion – at least merging once a day into the main branch. I’d say the more frequent, the better: for example, every 2 hours is preferable to every 24 hours; and if you can work with a single branch by default and merge every few minutes, that’s icing on the cake (in my experience, the difference is enormous, but life is tough and we do what we can...).
    - Those “huge test suites” you mention – what exactly makes them so huge? Is it a large non-modularized monolith? Or is it because there are “too many” slow tests?
    - As I mentioned above: we must parallelize everything we can. Most of our tests (regardless of type, even integration and e2e) should be parallelizable (by default, with few exceptions, they should initialize what they need autonomously and then restore everything as it was).
    - With proper modularization, perhaps only the tests that give us enough confidence for deployment could be run (only triggering the affected ones, using “contract testing,” only the most critical e2e/functional/acceptance tests, etc.).
    - And finally: it is advisable to have many more fast tests than slow ones.

1. **I have mixed feelings about pre-push and pre-commit hooks, as I’ve seen that sometimes they lead developers to make larger commits than they should in order to avoid running linting, tests, etc. multiple times. I wanted to ask your opinion about that – if you have experienced it and, if so, how did you channel the situation.** [Question received via Twitter, thanks Eneko 🙏]  
    - First, I’d need to understand why linting, tests, etc. fail multiple times. Is it because there are flaky tests or some type of non-deterministic validation? Or is it simply because developers “make mistakes”?
    - I haven’t encountered the situation you describe, perhaps because there are several aspects on which I always place high priority with Git hooks:
      - They must be **VERY fast**. Otherwise, one will be tempted to skip them or wait until you have many changes to run them.
      - They must be deterministic: the result should not vary if the “input” (tests, linters, whatever) hasn’t changed.
      - We normally practice TDD, so if a test fails, we usually find out sooner rather than later (**shortening the feedback loop**).
      - We have linters and formatters configured in the IDE exactly as they are in the Git hooks. This usually provides even faster feedback and almost no surprises when Git hooks run.
    - And… basically that’s all I can think of 😅 As I said, I’d need to experience the situation in person to fully understand where the friction is 😊🙏

1. **Doesn’t the possibility of doing Continuous Deployment go hand in hand with the criticality of potential application errors? That is, it is not the same to introduce a bug in, for example, a music streaming platform as in a financial transactions app or one that handles very sensitive data.**  
    - In my opinion, no 😊 The main motivation for “Continuous X” (Integration/Delivery/Deployment), as I mentioned in the talk (sorry for the self-reference), is to **LEARN quickly** (so that we can adapt and reorient ourselves fast and deliver value quickly). We want feedback as soon as possible about both **WHAT** (user/client/business needs) and **HOW** (systems/technology/organization). And generally, we want that all the time; in fact, it seems to me that in the example you mention (and in my experience) it probably applies more in the music app than in the financial one.
    - As I see it, the reasoning is actually the opposite: it is to enable that continuous learning, those rapid feedback loops, for which we need, among other things, a very strong safety net that will result in fewer application errors. Reducing bugs is not an end in itself; it is a means to other ends (improving user experience, delivering value, continuous learning, etc.).
    - In other words: in the false dichotomy of “quality vs. speed,” only with good internal quality can we achieve speed.

1. **It seems we try to reinvent the wheel but always end up coming back to Eliyahu Goldratt’s concepts. In what cases do you think we should NOT apply all these principles? Or conversely, do you consider them universal for any problem space?**  
    - Uuffff… a difficult question. In summary: no, I don’t think they are universal for every problem space. For example, if you have a pure, hard CRUD where you “know” it will hardly evolve (something I’ve almost never encountered, but let’s imagine), then I wouldn’t apply them. There is no uncertainty (or so we believe), nothing significant to learn. But more importantly: in that context today **I wouldn’t even develop software**, as there are plenty of NoCode tools to resolve such cases (e.g., when business domain logic is minimal).
    - If I were to act as a “coach” 😜, I’d talk about the [Cynefin framework](https://en.wikipedia.org/wiki/Cynefin_framework) and that in the “clear” domain, everything is already sold.
    - That said, I believe that statistically (at least based on my [anecdotal evidence](https://en.wikipedia.org/wiki/Anecdotal_evidence)) this context is infinitesimal; it is not the usual context in which we operate and for which we are paid.

1. **When, due to the context of initiatives (e.g., very complex changes), you cannot merge daily, can it still be considered Continuous Integration?**  
    - First, I’d need to understand that context much better.
    - Here I will “challenge” it: in most cases where someone or a team has indicated that their context was “special” or “too complex” and therefore they couldn’t do X or Y, when I’ve dug deeper, asked questions, and tried to understand, I (or we) found that the underlying problems were different and that it was actually possible to do it (or at least start moving in that direction). I’m not saying it’s your case, because I lack a lot of information, but I do say that almost always it is possible.
    - In very sporadic cases, anything goes – we are human and that’s what happens (and indeed there are specific situations where there is no alternative). But if that is the everyday situation, if you really can’t merge daily into a main branch for your regular work, I find it hard to believe that it isn’t a matter of knowledge, principles, and practices (i.e., a self-generated problem). It is probably “accidental complexity” rather than “essential complexity” (see the famous [“No Silver Bullet” by Fred Brooks](http://www.cs.unc.edu/techreports/86-020.pdf)).
    - In any case: if you aren’t merging at least daily, I don’t think we can talk about “continuity” (and it’s not about linguistic purism, but about the value of the practice).

1. **How would the process be for deploying front-end features that depend on back-end changes using TBD?**  
    - To use a cliché: I’m glad you asked that question 🤣. In fact, during the networking session someone asked me the same case (perhaps it was the same person).
    - _Disclaimer_: It is highly recommended that an entire **_value stream_** be handled within the same team. There are always exceptions, but as a general rule both the Front and Back for an end-to-end feature should be **the responsibility of the same team**.
    - On one hand, I must again mention the importance of using [feature flags](https://martinfowler.com/articles/feature-toggles.html) to enable various changes in parallel. For example, for this specific case, we could have a **_feature flag_** both on the Front and the Back (with the same default for both), so that either part can be continuously deployed without impact for the users, while progress is made gradually or while waiting for the “other part.” The idea is to hide from the user what is not yet functioning correctly because it is still under development.
    - At this point, I’d like to share a concrete experience that I find very relevant for this case: the project we worked on at [Codium](https://www.codium.team/) for a client, from which I showed one of the [Continuous Deployment pipelines](https://speakerdeck.com/islomar/valor-por-encima-de-codigo-el-poder-del-despliegue-continuo?slide=44) we had (specifically, the back-end one).
      - **Important context:**  
        - We formed a mixed team of 3 people from Codium and 3 from the client (one of them acting as “Product Manager”). We worked in **pairing and ensemble programming by default**. And although one person was more specialized in Front and another in Back, the rest rotated between both worlds: there were hardly any silos or isolated compartments—in the team almost everyone did almost everything (each with their own strengths, of course). We were also very autonomous in the Systems part.
        - There was a Back-end (in PHP, with Symfony) and a Front-end (React with TypeScript). The Back published an HTTP API that the Front consumed.
      - Bottom line: we used [OpenAPI](https://www.openapis.org/) to define the contract to be met between Front and Back. When a new behavior (or change) was required that implied changes on both sides, the first thing we did was to gather the entire team to write the “contract” together. In a YAML file, OpenAPI allows you to define that contract – e.g., the endpoint URI, input types, output types, HTTP status codes returned, etc.
      - Once we had this contract written by everyone, we could, if we wanted, tackle the Front and Back separately. Depending on the type of change, sometimes not even a “feature flag” was needed.
      - To ensure that neither side broke the contract, we had several validations in Git hooks and in the pipeline (as you can see in the diagram I shared):
        - **Back-end:**  
          - We used [schemathesis](https://schemathesis.readthedocs.io/en/stable/). It is a tool that automates testing of HTTP APIs by dynamically generating test cases from the OpenAPI contract. It allows multiple configurations depending on the number of tests desired, parallelism, etc.
          - Basically, we used it to run dynamic tests based on the contract against the API published by the Back.
          - We ran it at two different moments:
            - In the pre-push Git hook, against a local environment (automatically brought up with Docker).
            - During the pipeline, for example against the Staging environment, once the Back was deployed there.
        - **Front-end:**  
          - We used [jormaechea/open-api-mocker](https://github.com/jormaechea/open-api-mocker), which is an API mocker based on OpenAPI 3.0.
          - It essentially spun up a mock server based on the OpenAPI contract, which received requests during certain types of Front-end tests.
        - The YAML file with the OpenAPI contract was present in both the Front and Back: this duplication wasn’t ideal, but it was very “cheap” at the time. In the pipeline, we had a validation to ensure that the contract was exactly the same on both sides (and, of course, we would immediately notice if it wasn’t).
      - **IMPORTANT:** The choice of these tools was made several years ago; it is very likely that better solutions exist today 😊  
      - If the Back endpoints were consumed by **many** more consumers (excuse the redundancy), perhaps we could consider more advanced (and much more complex, better to wait until it’s REALLY needed) solutions like [Pact](https://pact.io/).

-------------------------------------------

**And that’s it!!** With this, I finally scratch the itch of not having been able to answer any questions after my talk 😊

I truly had a lot of fun answering these—it was an interesting exercise, and I only hope I’ve provided something valuable to someone 🙏
