---
layout: post
title: Leveraging Cloud GPUs for Accelerated Machine Learning Experimentation
tags:
  - machine-learning
  - cloud
  - mlops
---

If you were to browse the most popular Hacker News posts of 2022, it would read
like Machine Learning has crossed into the collective consciousness of the
[late majority](https://userguiding.com/blog/technology-adoption-curve/).
Models like [Stable-Diffusion](https://en.wikipedia.org/wiki/Stable_Diffusion)
and [ChatGPT](https://en.wikipedia.org/wiki/ChatGPT) made regular sensational
headlines ranging from admiration, tounge-in-cheek applications and of course
controversy. It's difficult to imagine that conversations surrounding these
innovations will fade into the background because for one the predictions can
seem nothing short of magical, and for two the ethical by-effects of these
models can already be observed in the microcosms of art and education
industries.

As somebody with experience in building software the _old-fashioned_ way (i.e.
code sans the ability to learn) I think now is a great time to study what our
Computer-Science colleagues have been working on and how they do it; to learn
what we have in common and where we might diverge. Initially the intent was to
summarise my findings in a punchy click-baity article however the experience
has humbled me into exploring the areas more thoroughly... If you'd like to
follow me down this path I'd like to recommend using the [trusty old-fashioned
way](https://www.kieranbamforth.me/feed.xml).

To that end, this post will focus solely on the challenge of setting up a
machine that is capable of experimenting with training a large nerual network
quickly.

# Goal / Objective

When learning something new it is helpful to have a high-level goal such that
when challenges are hit, we can break to check if our current approach is worth
persuing. As I was initially inspired by AI-generated portraits, it is fitting
that we aim to have a fine-tuned Stable Diffusion model at the end of this
process; one that is capable of generating our picture. To set some parameters
on this goal:

1. We *will not* be using Google Colab to train our model. Google Colab is a
   product that is similar to Jupyter in that you can write notebooks which are
   hosted on Google's architecture. For our goal, Colab abstracts too many
   details away that I think are important for getting a deep understanding of
   how the software/hardware components work together.
2. We would like experimentation and training to behave in the exact same way
   of the machine that these tasks are run on. At the time this was written,
   there were two major chip architectures (x86 and ARM) that can be a source
   of problems when we try to run the same source code on said chipsets.
