---
layout: post
title:  So long, Boxen!
tags: dotfiles
---

In case you&rsquo;re unacquainted, [Boxen][boxen upstream] is an open source project that can setup your macOS machine(s): it automatically installs apps, developer tools and just about [anything else you might need][boxen minecraft]. Unlike [third-party backup services][backblaze], Boxen does this by reading [manifest files][puppet manifest files] you provide&mdash;thus affording you all the advantages of [Infrastructure as Code][ioc wiki]:

* You have full control over what gets installed, and *where*. This is unlike backup services I&rsquo;ve played with, which appear to just back up and restore *everything* on your hard drive.
* Configuration files (such as your `.vimrc`) can be committed to source control. This allows you to experiment with different setups, `$ git checkout` if it goes all wrong, and ultimately `$ git commit` to new and *exciting* ways of working.
* If you can automate your setup on one macOS machine, then you can automate your setup on *any* macOS machine! &ldquo;Setting up&rdquo; becomes a case of checking out your Boxen repo, and running the `$ boxen` command.

In fact, Boxen worked so well for me, it was part of my workflow for two years. I&rsquo;d:

1. `$ git commit && git push` new setups on my Laptop A.
2. `$ git pull && boxen` on my own Laptop B.
3. Marvel how fast Laptop B became a clone of Laptop A!

This workflow enabled me to transition between two unconnected machines seamlessly, in a way that *encouraged* me to play with new tools and configurations.

## By developers, for developers!

In my opinion, Boxen&rsquo;s greatest feature is that it provides a free [&ldquo;App-Store&rdquo;][boxen repo list] for developer tools. You&rsquo;ll find tools of which you are familiar, but you&rsquo;ll also find tools of which you are not. And it&rsquo;s here&mdash;in the latter category&mdash;where comes joy of using Boxen. A few of my favourite discoveries include:

- [Tmux][tmux wiki]: how many terminal windows or tabs do you have open right now? If your answer is > 1, you could probably <s>change your life</s> benefit by trying out Tmux. Tmux is like a [tiling window manager][twm wiki], but for your terminal.
- [Vim][vim wiki]: okay, you&rsquo;ve probably heard about Vim&hellip; However Boxen&rsquo;s standard installation includes Vim plus several useful plugins, which encouraged me to drop hefty IDEs and switch to Vim.
- [Hub][hub github]: Is GitHub part of your workflow? This CLI tool from GitHub enables you to raise pull requests&mdash;and more&mdash;right from the comfort of your command line.
- [Flux][flux]: Research suggests we should avoid gadgets before bed, to [stop light interfering with our sleep patterns][cnn sleep]. As night approaches, Flux reduces the blue light emmitted from your screen to ease your eyes into sleeping.


## But then came the woes.

* A brainchild of GitHub, it&rsquo;s no surprise that Boxen has opinions about &ldquo;how to do things&rdquo;. Do you have any `*.dev` entries in your `hosts` file, mapped to local projects? Then brace yourself&mdash;as running `$ boxen` for the first time, will transfigure them into this:
![A screenshot of a local project after running Boxen][boxen nginx octocat]
This sorcery is caused by GitHub&rsquo;s [custom build of NGINX][boxen nginx]: it clobbers `localhost:80` [by default][boxen nginx port 80], and all `*.dev` requests get resolved to it via [dnsmasq][boxen dnsmasq]. Basically, should you not be employed by GitHub, expect to reverse engineer Boxen from time to time.
* Boxen &ldquo;gatekeeps&rdquo; the suite of open-source tools it provides; configuring them via [Puppet modules][boxen homebrew] instead of [the tools&rsquo; norms][homebrew bundle]. Your tools&rsquo; configuration therefore is useless outside of the realm of Boxen. Furthermore, your ability to use the open-source tools&rsquo; updates is limited by how fast the Puppet modules can implement them.
* Updating your Mac with Boxen can take a *long* time, as Boxen uses [Puppet][puppet] under the hood. Every time you run `$ boxen`, Puppet has to [compile your manifests into a catalog][puppet catalog compilation], before it actually *applies* said catalog to your Mac. In other words, Puppet hangs for (*at least*) a minute, deciding what your &ldquo;perfect&rdquo; Mac should look like. Then&mdash;happy with it&rsquo;s vision&mdash;you&rsquo;ll have to wait some more, whilst Puppet goes about &ldquo;making it so&rdquo;.
* [Keeping][boxen upstream merge 1] [up][boxen upstream merge 2]-[to][boxen upstream merge 3]-[date][boxen upstream merge 4] [with][boxen upstream merge 5] [Boxen&rsquo;s][boxen upstream merge 6] [upstream][boxen upstream merge 7] [repository][boxen upstream merge 8] [is][boxen upstream merge 9] [hard][boxen upstream merge 10]: every now and again, you should pull the [upstream project][boxen upstream] into your [fork][boxen fork]&mdash;to keep your Mac up-to-date. However, my experience of this hasn&rsquo;t been so smooth; like with all the merge conflicts I&rsquo;ve had to resolve, or when package managers (like `$ pip` and `$ brew`) started to fail randomly. [Shared module][boxen shared modules] updates have also been known to break things&hellip; all of which makes pulling updates, somewhat a chore.

## Boxen is dead, long live Homebrew!

The biggest nail in the coffin for Boxen came from [@MikeMcQuaid][mikemcquaid]; then maintainer of the project. In a [GitHub issue][github drop boxen], Mike states GitHub is no longer interested in maintaining Boxen, and furthermore has moved on to maintain the [Homebrew][homebrew] project. Homebrew can do most things Boxen can (check out [Brewfiles][brewfile usage] for keeping your dependencies under source control!), with zero dependencies on Puppet.

Although I invested lots of time into maintaining my [Boxen configuration][boxen fork], migrating to Homebrew was a natural, easy step thanks to [@MikeMcQuaid][mikemcquaid]&rsquo;s [Strap][strap] script. And in the rare cases Homebrew didn&rsquo;t provide me what I wanted, it&rsquo;s [infinitely easier to extend][custom brew repo] then Boxen.

[backblaze]: https://www.backblaze.com/ "Backblaze backup software"

[boxen 2013 website screenshot]: /images/boxen-website-2013-02-18.png

[boxen dnsmasq]: https://github.com/boxen/puppet-dnsmasq
[boxen dnsmasq dev requests]: https://github.com/boxen/puppet-dnsmasq/blob/master/templates/dnsmasq.conf.erb#L5:L6

[boxen fork]: https://github.com/kieran-bamforth/our-boxen

[boxen homebrew]: https://github.com/boxen/puppet-homebrew

[boxen nginx]: https://github.com/boxen/puppet-nginx
[boxen nginx octocat]: {{ "/assets/boxen-nginx-octocat.png"  | relative_url }}
{: height="331px" width="570px"}
[boxen nginx port 80]: https://github.com/boxen/puppet-nginx/blob/master/manifests/init.pp#L5

[boxen minecraft]: https://github.com/boxen/puppet-minecraft

[boxen repo list]: https://github.com/boxen?q=puppet

[boxen project]: https://github.com/kieran-bamforth/our-boxen/tree/master/modules/projects
[boxen project port]: https://github.com/kieran-bamforth/our-boxen/blob/master/modules/projects/templates/shared/nginx.conf.erb#L2

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

[brewfile usage]: https://github.com/Homebrew/homebrew-bundle#usage

[custom brew repo]: https://github.com/kieran-bamforth/homebrew-repo

[cnn sleep]: https://edition.cnn.com/2016/10/31/health/kids-sleep-screens-tech/index.html

[flux]: https://justgetflux.com/

[github drop boxen]: https://github.com/boxen/boxen/issues/197 "GitHub announced they were no longer maintain Boxen"

[homebrew bundle]: https://github.com/Homebrew/homebrew-bundle
[homebrew]: https://brew.sh/

[hub github]: https://github.com/github/hub

[ioc wiki]: https://en.wikipedia.org/wiki/Infrastructure_as_Code

[mikemcquaid]: https://github.com/MikeMcQuaid

[puppet]: https://puppet.com/
[puppet catalog compilation]: https://docs.puppet.com/puppet/4.9/subsystem_catalog_compilation.html
[puppet manifest files]: https://docs.puppet.com/puppet/latest/lang_summary.html#files

[remove nginx dnsmasq]: https://github.com/kieran-bamforth/our-boxen/commit/9b598e979db5adfc0fe1796b487f242f63c0f95d

[strap]: https://github.com/MikeMcQuaid/strap

[tmux wiki]: https://en.wikipedia.org/wiki/Tmux
[twm wiki]: https://en.wikipedia.org/wiki/Tiling_window_manager

[vim wiki]: https://en.wikipedia.org/wiki/Vim_(text_editor)
