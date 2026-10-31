---
title: Once an AI novice, now maybe a little less of one ✨
date: 2026-10-26
description: Where I started with AI, the mistakes I made, and why it doesn't have to be scary, even if knowing your stuff is your superpower.
tags: ai, productivity, ios, mobile
image: https://andrewlawler.github.io/images/posts/once-an-ai-novice/cover.jpg
alt: Cover image for Once an AI novice, now maybe a little less of one ✨
---

Hi! 👋🏻 It's me again. If you read my last post, you'll know I've just come back to this blog after six years away. A lot has changed in that time, for me and for the landscape of iOS. One of the biggest changes for me has been AI and how I work with it.

So this one is a bit more personal. It's about where I started with AI, the mistakes I made and what I've learned so far. If you're someone who takes pride in knowing your stuff, and AI feels a bit scary, this one's for you.

## 🧠 Knowledge was my superpower

Before I joined Depop (my current role), my AI usage was pretty much asking ChatGPT a few basic questions when the Apple Documentation, developer forums, Stack Overflow or asking colleagues couldn't help me solve a problem.

For me, knowledge was always my superpower. I wanted to know the syntax for things off by heart, I wanted to know the nuances of different APIs, when to build certain things and when not to. I wanted to be the person who people would look to ask when they needed help or the person that the product manager reached out to when they had an urgent issue. Before the world of AI this was the way I saw to try and push myself forward and this took a lot of outside learning and time.

So when AI first started coming into the iOS landscape, I was like most people: very sceptical. Not only of how good it could be. If I'm honest, I kind of wanted it to not be that good. I took a lot of satisfaction in being the person who knew a lot of the little details about lots of different topics and it just so happened that AI would probably be a little bit better than me at that. It could probably answer all the questions people asked with more detail in less time. This concerned me. It left me asking myself: *if AI can do this better than me, what can I do better than AI?*

## 🐣 Getting started

About 14 months ago I joined Depop, and joined a team with a very different mindset than the one I was in before. This team embraced change, it embraced AI and was set out to utilise it as much as possible. Unlike my prior role, I suddenly had access to all the latest and greatest tools and I was surrounded by people who also had much more experience with them than me. 

I, on the other hand, was still writing all of my work by hand. I'd never used any of these tools before, and I didn't really know what they could do. To be fair, 14 months ago I don't think many of us knew either.

In my previous role I was a Senior iOS Engineer in a team with lots of varying skill levels. Without AI, it was my job to help, mentor and be the person who solved the tough tasks when they needed solving. I'd completed huge migrations, worked on vast technical challenges and written tons and tons of documentation, and I'd never relied on AI or even thought *I wonder how this would have gone if AI did it*. The thought of letting go of this and taking a step back to begin using AI was a little daunting to me.

But the team I was joining was much more open minded and this really opened my eyes. My first step was just installing Claude and giving it a go. It felt like a similar experience to the first time I ever used Xcode, I didn't really know what to expect but the results honestly blew me away. I had no real setup, I didn't even know what a context window was, or a skill or anything for that matter but I was still producing work in a more efficient way than I was before. This was honestly quite exciting.

### ⚡ So, where did I go from there?

Well like everyone probably did, I might have gotten a bit carried away. Even before AI I was always probably known for moving quickly. Even at school my parents would be told by teachers that I just did things very quickly and maybe I needed to slow down. I remember in my first iOS role as a Junior I was told to not bring more than 3 pieces of work onto the board at once as I couldn't manage them all at the same time. So you can probably imagine what I attempted to do when I had AI to basically duplicate myself... I just tried to do too much. I think I found out quickly that you *can* do it, but it doesn't mean you should. My work was good but it wasn't as high quality as my work before and arguably I hadn't learned as much from the work as I could have. 

> 💡 **Tip:** I think a key thing someone told me early on is that if AI can do something you would have done before in 60% of the time, at least spend another 10% of the original time reviewing and analysing what you have done, you'll still have saved 30% and it will at least be something good. 

![Bar chart: before AI, doing the work takes 100% of the time. With AI, the AI-assisted work takes 60%, reviewing and understanding it takes another 10%, and 30% is saved](/images/posts/once-an-ai-novice/review-time.png)

### 🌊 Information overload

Once I had got accustomed to the basics of using Claude I wanted to try and progress a little more. Lucky for me I had people around me who were much further along in their AI journey than I was. We regularly had sessions in which people would share the skills they had been working on, the different use cases for AI they had found and basically everything else weird and wonderful about the AI landscape that maybe we would find interesting. Things like cookbooks, recipes, hooks all sorts.

This was amazing, it was my first real look into what was possible but it was just.... a lot of information? I think the expectation was just that everyone would be on the ball with everything but the landscape changed so much that it almost felt hard to digest, at least for me. So my plan changed to just: *can I make one small change at a time?*

## 🪜 One small step at a time

So I took small steps. As with anything, I just needed to at least start.

![Four rising steps: 1. Use other people's skills, 2. Write your own skills, 3. Add hooks, 4. Build a knowledge base](/images/posts/once-an-ai-novice/small-steps.png)

1. **Using other people's skills.** I started by trying the skills others had built and presented, seeing how they worked and how I could best make use of them.
2. **Writing my own.** Once I was comfortable with that, I tried creating my own skills. Even to this day it's become a great way to share knowledge within the team and the organisation. Personally I've contributed by writing a few skills such as:
	1. A skill to review your Claude usage to give you tips to improve (kind of like what this one small step at a time approach did for me).
	2. A skill to help you with end of year reviews, utilising Claude to pull feedback for people you work with.
	3. A skill to help write better documentation for a specific architecture we use.
3. **Hooks.** One problem I realised after having such a large amount of skills to use was just... how do I know when to use them? We know Claude is supposed to invoke them but that doesn't always happen. For me I had to set up hooks to let Claude tell me when I might want to use a certain skill. This has been really valuable for me and it's something I've shared with others within my team who had similar concerns.
4. **A knowledge base.** Most recently, I set up a knowledge base. My notes live in Obsidian, and [qmd](https://github.com/tobi/qmd) indexes them so Claude Code can search them for context before asking me. This post actually started life there as a page of raw notes. For me this was probably a mistake I made for the longest time, I didn't realise how little useful context Claude actually had about me in its memory and making a change to actually formalise the storage has had a huge impact.

> 💡 **Tip:** A skill is a set of instructions that Claude loads when a task needs it. If you find yourself explaining the same thing to Claude more than once, that's a good sign it should be a skill.

I recently gave a small talk at our iOS guild, and my main suggestion was simply this: make one small improvement to your workflow at a time. With AI it can feel like you should be doing everything at once, but as I've found over the last 14 months, that doesn't really work and my approach has always just been to make one small step at a time.

## 📱 Putting it into practice: Second Skin

In my last post I mentioned **Second Skin**, my side project for keeping track of your tattoos. It's where I've been putting all of this into practice outside of work.

I made one rule early on: I write the code. Claude explains things, reviews my work and only writes parts when I ask it to, which is usually the repetitive stuff I don't learn much from. 

Before I start a ticket, Claude writes up a list of requirements (Kind of like a product manager might do). Before I raise a pull request, it reviews my changes. At the end of each session, a handoff skill I wrote saves where I got to inside Obsidian, so the next session can pick straight back up.

I've also used it as a sounding board for design, exploring different directions for the app and going through round after round of app icon ideas. I'll be writing more about building it soon. 👀

## ✨ Where I am now

14 months on, I feel a lot more confident when it comes to AI and speaking about my experiences (which is what inspired this post). AI has become a core part of how I work, it can act as a sounding board for ideas, work as a partner when thinking about large technical problems or solutions, it can work as a planner helping me split things up and articulate them in ways to share with different stakeholders and much much more. Over time I've learned more and more use cases and honestly there's probably way more I haven't even realised yet.

I'd say I'm still getting used to adapting my thinking about where I sit in the landscape now. I've definitely shifted from being focused on every piece of syntax and nuance and now I'm more focused on engineering solutions and following good software principles. I've found this is the best way to work with AI to get the best solutions but overall I've realised that AI isn't this scary thing, even for those of us who saw the knowledge we had before AI as our superpower.

So, what can I do better than AI? I can be the guide: the person enforcing good architecture and software principles, and steering AI towards the best solutions. We should use AI to our advantage, and let it take the things that would take us the most time for the least benefit. That creates the space for the things AI can't do on its own, like thinking about the larger scale problems we have and how we can transform the areas we work in.

## 💡 If you're where I was

- **Make one small improvement at a time.** You don't need to adopt everything at once.
- **Start with what other people have built.** Try your team's skills and tools before writing your own.
- **Learn the tools before speeding up.** Spend some time learning how they actually work before trying to do more, faster.
- **Give the tools you have a go.** Whether they're personal tools or tools at work, AI gives us so many amazing ones. It's on us to try them and see what works for us.

## 🌱 Still a bit of a novice?

I'm still maybe considered a novice, and I'm still getting used to this world of AI, but I'm proud of where I'm at now with it compared to last year. It definitely feels like I'm getting somewhere, and I want to keep exploring. If you're on the same journey, I'd love to hear how you're finding it, or the one small improvement that made the biggest difference for you, in the comments.
