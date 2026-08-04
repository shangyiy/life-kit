# Session voice notes (as transcribed into chat)

## Provenance

Pulled from Grok session **compaction** user messages under workspace `Code`.

**Important:** Session storage here has **no separate `.wav`/`.m4a` voice files**. What we have is the **text that arrived as your user message** after voice dictation / speech-to-text (or typed monologue in the same oral style). Fillers and run-ons are kept as stored.

| Session | Id |
|---------|----|
| Interview / AE + interview-prep deck | `019fb736-b6ff-71d0-8962-f188c5fdf16d` |
| Agentic attention deck (later continuation) | `019fb6d8-bd46-7443-b4b1-bd6f4721941c` |

**Inclusion heuristic:** longer messages and/or speech-like fillers (`you know`, `like`, `right?`, `what I meant`, …). Short slash-style commands (`slide 2 B`, `merge 10 & 11`) are **not** listed.

Duplicates across session compaction copies are collapsed to the first capture.

---

## Note 1

- **Session:** Interview / AE deck session
- **Session id:** `019fb736-b6ff-71d0-8962-f188c5fdf16d`
- **Source:** compaction `segment_000.md`
- **Length:** 15428 characters

```text
So Few idea that I'm thinking so first one, how or what are the things that we're doing these days First thing we do is like trying to find a bottleneck from engineers Via the traits that we can collect it from the organization And, you know, the inside it's pretty much like From myself, not related to the org, it's like make sure the same thing as the previous topic, right? Better manage attention What that means is like ideally if you ask your agent to make a plan, it should make sure the plan is like solid You know, including the Design makes sense of maintainability and the validation steps are there Including all the relevant dependencies So it's kind of important on how to instruct the agent to make a plan, which is still a gap in my opinion, but we won't cover too much here. I think the idea here is like For me, my workflow, it's like Give the agent a p a problem, and then I have a skill to instruct the agent to make a plan with a few sub-agent to do a validation, and then also, you know look through different code path smartly to use like a cheaper sub-agent to make sure that the manager isn't overwhelmed by, you know, just plaintext that fell in into his context. and then I also have like a skill named like "Grill Me" from, like, you know, The guy called Matt from, from Internet. the goal is to Address some problem that, you know, just make sure agent is able to handle some of the issue that they can just, you know, resolve themselves before, before human to get into the back and forth. The reason is that human's attention is very expensive, right? So that's kind of the insight for me personally to Delegate most of the thing to the agent, but like you're still in the loop to make sure the plan actually looks okay. And then the next step will be like implementation slash validation. What that means here is like implementation, originally people are just like, you know, just do a test driven, but like as time goes by, you will, you will be noticed that the tests written by the agent are Redundant or the quality's bad. So what I did here is like I made the like a SAS unit test skill, which you know, encapsulate some of the knowledge that I got from the great school, which is like the professor from CMU. And then Use that skill with mostly just with like a mutation testing and to write the red test first and instruct the agent to do the TDD using that particular skill And once it's done Critical thing here is like I'm gonna have a validator agent, like, you know, a different agent from the one who actually do the code to independently like review the code. Generally, like three different instruction or actually just like Yeah, three. So one is like review the test case, review the ca-test case using the principle skill that I mentioned earlier, like, you know, a few different unit test skill I won't cover here, but if you're interested, feel free to just go and look my skill and then we also talking stuff about review the code to see if there is a bug This is something funny that I can talk about later, but like for here you can just assume review there if there is a bug. And the last one is trying to review the design means, is this code or like, is the implemented feature or function has specific bad code smell. note from my experience so far, this part like agent is still doing a bad job even though if you give it like some clear instruction, like, you know, for instance What kind of cold email are we able to see from the current period? A concrete example here is like I have a class slash function that it's like streaming back the agent SDK result And I have some sort of like auth-specific behavior that ideally that response streamer shouldn't be aware of, but the Adrian's writing code like, you know, expose too much detail for that response streamer, and I asked him Many times, like, you know, what's the problem of this code? What cosme does it has? It's not able to justify like, what's the, what's the better design? Like, I still have to like manually ask it to like write a pseudo code and then like teach it, hey, you know, you can extract like, have a better interface and then, or just even have a better encapsulation to extract these kind of detail away from your response streamer, so on and so forth. and then that thing can be Better extent in the future. So that's kind of the gap that I'm observing on the, the current model. Like when I say current model means like the model we have today. Okay, so this is kind of like the part about workflow slash manage attention. The, the core idea here is like make sure your attention only goes to where it deserves it. For me, the first thing that deserves my attention is like where the plan looks reasonable and then actually address the problem with the proper, you know, suggestions or like, are, does it fixing the right thing in the right place? The second place that needs my attention is like the actual code And everything in between, ideally, I want to automate or like dedicate to agent to get it drive end to end. Here are a few things, for instance, like unit tests should be passing It shouldn't give me a PR that doesn't pass the unit test. CI should be green, it shouldn't give me a PR where the CI is not green. And like, you know, the validation or like the end-to-end test should be passed, and then PR description should be updated. I don't want to see a PR that isn't in a ready stage, like it's wasting my time to review a thing that could change or, like, you know, it could fundamentally not Right. And that's a little bit tricky, like your agent can pass local unit tests, but like if you ask it to do some like an integration test, it's sometimes not following. but yeah, that's for the for the models today. So TLDR for this particular session is like beyond vibe coding, trying to understand where your attention actually leak, and then how you can regain your attention by, you know, for me, have a skill to delegate most of thing or like change small subs small steps, so I can parallel more stuff to work on. Alright, cool. So this is, this is about one session individual workflow. Another qu-problem here is like, so that said you have a perfect workflow, you can dispatch like five or ten at a time, the problem will become how can you find that many things for you to work on? Right? Like If a person open 40 PRs a day and then In his team, they have five person. How is it possible for you to have like five times like forty kind of different meaningful tasks for people to do? That is actually something that I found interesting. Like I see many people claiming on the internet that, you know, "Oh, I open so many PRs a day, my agent take work for is so fucking good." But like, in reality for me, it's like If, if I want to just burn my token and open all the fucking PRs all the time, I can do it very easily. For instance, I can have a cron job and just like picking one folder at a time and then just like launch a bunch of agents, follow the, not a bunch of agents, like I can do something simple, just like, you know, hey, I have a bug fix task, then I can just like do a loop that, do it like every single day, and, you know, the way I can do my bug fix task With something like user code comments to write a spec test, and then trying to hunt the bug based on the, you know, the my previous unit test skills, for instance. And then I can also automate my agent loop saying, "Hey, for every day, go look back in the past twenty-four hours and then see if there's an error log and analyze if that's normal, if that's not normal, please like raise a fix with the workflow we mentioned earlier." But you know what? The thing matters here is like, these stuff doesn't really matter. Like it doesn't bring you the business value. That's something that I personally found. And it's kind of like in progress, I'm still arguing with my manager, like, "Hey, you guys are trying to boost, like, boost the productivity, but I feel like the real problem is like, okay, now you have 10x productivity, do you have 10x jobs for people to do, like, in parallel? I don't have a good answer for this yet, but just, you know, like, this is like my recent observation. Okay, now next. Yeah. So people are like, "You just get agent to vibe. What is the best agent? And what is the best combination? What is the best skill?" So you'll start to see like there are many, many, many, many thing called benchmark. Whenever there's a new model comes out, there are some fancy people will do some sweet benchmark, blah, blah, blah, to value, you know, evaluate whether the model is good or not. But those are for like general suite test. It's not Representative, at least for me yet, for people's internal usage. Example like what I mentioned my workflow earlier is kind of like a, a meta skill that composes different each small step skill together. And People are like Like take Grok 4.5 as an instance, you can see like there are many benchmarks like, "Oh, this model is so good, doing all the jobs," but it doesn't work for me From like my workflows aspect, because it literally just doesn't follow my methodology. Like when, when it's like running a step, for instance, like test-driven development, and then the next step is like doing the end-to-end testing, and then you will forget to, you will like not follow the next step, like end-to-end testing, you will just got lost during the TDD, for instance. So, you know, this is kind of Where eval comes from means like the evaluation that built on top of your own skill So the topic I want to talk about here is in the past, we focused on a thing called like code review skill, and the hypothesis at that moment is or not the hypothesis, like the direction or the goal at that moment is like build a, you know, internal code review skill that can catch most of the bugs So we actually spend like two or three weeks just having one or two engineers there and then source bugs, like figure out a source bug, and then like trying to write some skills to overfit the problem or like, you know, trying to have a general solution doesn't matter. But the fun thing here is like while Opus Five comes out The native model, it's actually just Good enough to All the skills we're reading. So that brings me to another point when you're building the eval or like the agent tech tooling today, for me personally, if you're not in a frontier lab that actually train the model we should probably build the tool with the assumption that model will getting better and better. Slash means build the improvement tool that Can pick the best option for you on your use case, basically. So in the past, we are kind of trying to build the skills ourselves and You know Add on top of the model. But the thought I have at this moment is more like build the surrounding automation pipeline and then promote the best combination at the given moment based on our use case to the engineers. Example, in the past, we're, you know, having one or two engineers manually source the Evals like, you know, bugs in a code review, for instance, and we are kind of like Manually just ask them to write a skill because like AI is pretty bad at like writing a good skill, like Very bad. Especially like distill kind of like concept or design this kind of thing or distill sort of like principle, agents not good at that. So we pretty much have to have the human loop, like we actually have some attempt in the past like trying to do some sort of like RL loop for the skill, it doesn't make it, it doesn't work. we won't cover that here, but like if people are interested, feel free. So In the past, we were like human-driven trying to target, is trying to build a skill, but what I have in mind now or like what the direction I'm pushing for is like build the surrounding automation, automate the principle that we source the eval or like source the bugs, and just like make it part of the Daily job, daily chrome job, pretty much. And For that they need Chrome job. We can also just run the eval in the, whenever there's a new model comes out or like a new harness comes out. So We can have like a weekly compete on the eval we collected for our use case, and then just like automatically promote the best options to engineers, say, "Hey, you know, this is currently the best." For our use case, use it. That's it. And this is kind of like a surrounding ecosystem built on top of the assumption that model will improve, so we shouldn't bother And that also brings to another topic today here is like, you know, whenever people claiming, "Oh, I'm shipping like forty or more PRs a day," that pretty much like means they trade two things for throughput. Anyone can name that to you thing based on the previous context. So the first thing here is like the quality of design Or the maintainability. I don't, I don't believe that the model is good enough to, like, you know, one shot the good design by default. And there is no fucking way a person can review more than 40 PRs himself or for his teammates, and then, like, you know, walk through all the design and justify, "Hey, this is shit, this shouldn't be like that, there is a better design for this software." At least for me, if I need to spend time to explain to my agent or explain it to my teammate, it will take me at least like an hour on the PR That is like, I don't know, one thousand line, for instance. therefore, like the first thing you trade is kind of like design quality The second thing you trade is like The usefulness of the PR they generated. So as I mentioned earlier, I don't think it is possible to have every day forty PRs a day in all of members on your team. That doesn't make any sense to me. From, you know, those work It's impossible all of them aren't bringing business value. So, I guess my point is here is more like Optimize for individual workflow and you can parallelize the thing if there are actually important stuff that you need to do Not like people are like, "Oh, forty Yards a day, and you're just like, "Oh, cool, I want to beat that." But like, you're, you're gonna find out you're gonna have like 30ish PR just like random bug fix or like adding to some random small shit with sort of like a daily automation that doesn't even, like, for me in my opinion, like, doesn't even should exist at all. Like, you can have like a daily bug hunt PR, but like Those doesn't really matter, right? I don't even want to bother to learn the context from those bugs that isn't affecting customers. Or those bugs aren't trivial enough, yeah, sure you find it, so what? It doesn't hurt, and then I need to spend my attention to review your PR, like first get the context of what you're talking about, and then just realize, oh, it's like it's pretty neat fix. I was like Okay, sure, fuck it, I don't care. That's, you know What I feel about forty, fifty lines of like forty, fifty PRs a day, those people are claiming. I feel like the bigger problem here is like, how can you find the reasonable things or like valuable things to do, and then you can dispatch that without being bothered by other human or like without being blocked by other human. I feel like that's, that's the real thing, true thing. So yeah. Anyway, these are just a few contexts that I think maybe it could be good to share. If you can extract some sort of logic or topic from here, that would be nice.
```

## Note 2

- **Session:** Interview / AE deck session
- **Session id:** `019fb736-b6ff-71d0-8962-f188c5fdf16d`
- **Source:** compaction `segment_000.md`
- **Length:** 836 characters

```text
One thing, so my assumption for people's like, you know, 40 or more PRs a day work flow like what I say, they trade the throughput with Design quality, software maintenance, so on and so forth, plus the real, the usefulness, right? so I have a hypothesis that people doing that is, you know, with the assumption that model will get in better and You know, just like two months later. They can simply set up a loop like, you know, hey, go refactor my code with your whatever current supermodel capability, and that will be done by a day or two. That's kind of like my hypothesis, but I can't verify it. But like, if, if I'm gonna do that, that will be the only rationale that what I'm gonna do. But like, I, for me personally now, I can't sacrifice the quality or like, it hurts my soul. So Yeah, no, I'm gonna, no But yeah, that's right
```

## Note 3

- **Session:** Interview / AE deck session
- **Session id:** `019fb736-b6ff-71d0-8962-f188c5fdf16d`
- **Source:** compaction `segment_000.md`
- **Length:** 422 characters

```text
H1: core thesis focus on ready, how to ship. valuable is a different section yes. 

H2: ideally A talking about a single person workflow, then zoom out to a bigger picture - now you have the ability to ship 5, 10, or even more PRs a day, so what? hook to part B. 

B2B probably should be D section b/c need C context (build around skill with eval to build eval to find best fit)

H4: I don't really understand.

H5 agreed.
```

## Note 4

- **Session:** Interview / AE deck session
- **Session id:** `019fb736-b6ff-71d0-8962-f188c5fdf16d`
- **Source:** compaction `segment_000.md`
- **Length:** 374 characters

```text
H4 what I meant to say here is we used to build a skill to bridge the gap of model in general capacity (i.e. code review, or even AGENTS.md or skill instruction following - a bunch of MUST, DO NOT, etc. stuff in .md file) which seems to be wrong b/c model is improving by frontier labs. hence we pivot to design the surronding to pick the better fit wit hlight instructions.
```

## Note 5

- **Session:** Interview / AE deck session
- **Session id:** `019fb736-b6ff-71d0-8962-f188c5fdf16d`
- **Source:** compaction `segment_000.md`
- **Length:** 361 characters

```text
are we able to do assertion evidence format for each slide? also, I don't like A, B, C, D, kind of label w/o context what's better way to do this? keep title itself is fine. in the meantime, are you able to generate some fun picture for each head slide to illustrate the idea? good example will be sth like this https://refactoring.guru/design-patterns/mediator
```

## Note 6

- **Session:** Interview / AE deck session
- **Session id:** `019fb736-b6ff-71d0-8962-f188c5fdf16d`
- **Source:** compaction `segment_002.md`
- **Length:** 806 characters

```text
Write for engineers who are reading this for the first time.

Requirements:
- Use simple, direct English.
- Prefer common words over academic or corporate language.
- Every paragraph should communicate one idea.
- Each sentence should naturally lead to the next.
- Avoid unnecessary adjectives and filler.
- Avoid jargon unless it is required for correctness.
- Introduce acronyms before using them.
- Do not assume prior context.
- Make the writing self-contained: define terms, explain why something matters, and state assumptions.
- Explain cause and effect instead of merely listing facts.
- Use concrete examples when they clarify an abstract idea.
- If a reader could reasonably ask "why?" or "how?", answer it immediately.
- Remove repetition.
- End with a short summary only if it adds new clarity.
```
