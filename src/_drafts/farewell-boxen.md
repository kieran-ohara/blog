---
layout: post
title:  "Farewell Boxen <3"
date:   2017-02-10 18:29:52 +0000
categories: automation developer-tools shell
---
Hello shell scripts.

New years resolution. Drop Boxen.

2 years ago, I was lucky enough to be given a shiny new MacBook by my then employer. That night&mdash;like any other developer with a new toy&mdash; I tore through the cellophane wrapping (mmmmme gusta), smashed my way through the box, and had the lid of the laptop open with the iconic chime before (After all, any new opening of an apple product is a ritual).

And then it occurred to me, it was Mac setup time. As a fresh faced graduate that had recently learned about the joys of Puppet automation, a part of me wanted to treat this mac as cattle, not a pet. Quite radical for me at the time, as much as I hate to admit it, my Mac was my baby. It had all the software and configuration set just perfectly so, and here I was with a brand new Mac where I would have to start all over again&hellip; (I mean who wants to transfer old files and settings on to a fresh laptop? eww).

So I did a quick Google search and there I was introduced to Boxen.
![A screenshot of Boxen&rsquo;s website from February, 2013][boxen 2013 website screenshot]
The timing could not have been perfect enough. A graduate developer at the time, I was excited to learn that Boxen used Puppet. I can still remember the excitement 

What I learned from Boxen
* env all the things.
* Puppet modules, and puppet in general.
* I no longer had to install applications from DMGs.
* Vim extensions, and introducing me to Vim 

* A brainchild of GitHub; it&rsquo;s no surprise that Boxen has opinions about &ldquo;how to do things&rdquo;. Do you have any `*.dev` entries in your `hosts` file, mapped to local projects? Then brace yourself&mdash;as running `$ boxen` for the first time transfigures them *all* into this(!):
![A screenshot of a local project after running Boxen][boxen nginx octocat]
* Updating your Mac with Boxen can take a *long* time, as Boxen uses [Puppet][puppet] under the hood. Every time you run `$ boxen`, Puppet has to [compile your manifests into a catalog][puppet catalog compilation], before it actually *applies* said catalog to your Mac. In other words, Puppet hangs for (*at least*) a minute, deciding what your &ldquo;perfect&rdquo; Mac should look like. Then&mdash;happy with it&rsquo;s vision&mdash;you&rsquo;ll have to wait some more, whilst Puppet goes about actually &ldquo;making it so&rdquo;.
* [Keeping][boxen upstream merge 1] [up][boxen upstream merge 2]-[to][boxen upstream merge 3]-[date][boxen upstream merge 4] [with][boxen upstream merge 5] [Boxen&rsquo;s][boxen upstream merge 6] [upstream][boxen upstream merge 7] [repository][boxen upstream merge 8] [is][boxen upstream merge 9] [hard][boxen upstream merge 10]: every now and again, you should pull the [upstream project][boxen upstream] into your [fork][boxen fork]&mdash;to keep your Mac up-to-date. However, my experience of this hasn&rsquo;t been so smooth; like with all the merge conflicts I&rsquo;ve had to resolve, or when package managers (like `$ pip` and `$ brew`) started to fail randomly. [Shared module][boxen shared modules] updates have also been known to break things&hellip; all of which makes pulling updates, somewhat of a chore.
* Very verbose (unclear) output.
* Homebrew was not installed to the default place, brew doctor was frustrating.
* Randomly work some days, randomly stop other times.
* Updating your Mac with Boxen can take a *long* time, as Boxen uses [Puppet][puppet] under the hood. Every time you run `$ boxen update`, Puppet has to [compile your manifests into a catalog][puppet catalog compilation], before it actually *applies* said catalog to your Mac. In other words, Puppet hangs for (*at least*) a minute, deciding what your &ldquo;perfect&rdquo; Mac should look like. Then&mdash;happy with it&rsquo;s vision&mdash;you&rsquo;ll have to wait some more, whilst Puppet goes about actually &ldquo;making it so&rdquo;.
* [Keeping][boxen upstream merge 1] [up][boxen upstream merge 2]-[to][boxen upstream merge 3]-[date][boxen upstream merge 4] [with][boxen upstream merge 5] [Boxen&rsquo;s][boxen upstream merge 6] [upstream][boxen upstream merge 7] [repository][boxen upstream merge 8] [is][boxen upstream merge 9] [hard][boxen upstream merge 10]: every now and again, you should pull the [upstream project][boxen upstream] into your [fork][boxen fork]&mdash;to keep your Mac up-to-date. However, my experience of this hasn&rsquo;t been so smooth; like with all the merge conflicts I&rsquo;ve had to resolve, or when package managers (like `$ pip` and `$ brew`) started to fail randomly. [Shared module][boxen shared modules] updates have also been known to break things&hellip; all of which makes pulling updates, somewhat a chore.
* Interestingly, the last "nail in the coffin" didn&rsquo;t come from me; [it came from GitHub themselves][github drop boxen].

[github drop boxen]: https://github.com/boxen/boxen/issues/197 "GitHub announced they were no longer maintain Boxen"

[boxen 2013 website screenshot]: /images/boxen-website-2013-02-18.png

[boxen fork]: https://github.com/kieran-bamforth/our-boxen
[boxen shared modules]: https://github.com/boxen?utf8=%E2%9C%93&q=puppet-&type=&language=
[boxen upstream]: https://github.com/boxen/our-boxen
[boxen upstream merge 1]: https://github.com/kieran-bamforth/our-boxen/commit/47f6e64bf1ae9e963bd38df3f3c468661c970e76 "2014-09-30: Big update with upstream."
[boxen upstream merge 2]: https://github.com/kieran-bamforth/our-boxen/commit/ce44e80a991e1fb801c9a60dde212911b244bb2a "2015-02-19: Merge with upstream."
[boxen upstream merge 3]: https://github.com/kieran-bamforth/our-boxen/commit/8f039a6b6014b0a9b50e9ebcbe93af07603ac613 "2015-06-03: Merge with upstream."
[boxen upstream merge 4]: https://github.com/kieran-bamforth/our-boxen/commit/344f091b370a94c7863c1c8890f8d02ad3bb0f0e "2015-08-04: Lots of updaten."
[boxen upstream merge 5]: https://github.com/kieran-bamforth/our-boxen/commit/c6b13af9dec3d31857cb169014370737d6b0f0b5 "2016-01-25: Something something something?"
[boxen upstream merge 6]: https://github.com/kieran-bamforth/our-boxen/commit/7fe877f45882cda540b3ad99448fd2bba25a6e04 "2016-04-25: Merge master..."
[boxen upstream merge 7]: https://github.com/kieran-bamforth/our-boxen/commit/7c918942c9e633a0c3eb93938e92174884cac9c9 "2016-04-25: Merge working branch."
[boxen upstream merge 8]:https://github.com/kieran-bamforth/our-boxen/commit/1e41960fa2e0052a9d15c86201e533f6dd5f6cae "2016-05-10: Updates."
[boxen upstream merge 9]:https://github.com/kieran-bamforth/our-boxen/commit/26454fdaeb277fde70d4bbdbf52fc2b1bd4b80a1 "2016-05-10: Merge master."
[boxen upstream merge 10]:https://github.com/kieran-bamforth/our-boxen/commit/aa99351da2a47102a2a53f2d18d91299ab1e1cfb "2016-09-18: Merge upstream."

[boxen and localhost]: https://github.com/kieran-bamforth/our-boxen/commit/9b598e979db5adfc0fe1796b487f242f63c0f95d


[puppet]: https://puppet.com/
[puppet catalog compilation]: https://docs.puppet.com/puppet/4.9/subsystem_catalog_compilation.html
