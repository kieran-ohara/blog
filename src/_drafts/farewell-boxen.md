---
layout: post
title:  "Farewell Boxen <3"
date:   2017-02-10 18:29:52 +0000
categories: automation developer-tools shell
---
If you&rsquo;re unacquainted, [Boxen][boxen upstream] is an open source project that can provision your Mac OSX machine(s): it automatically installs apps, developer tools and just about [anything else you might need][boxen minecraft]. Unlike [third-party backup services][backblaze], Boxen does this by reading [manifest files][puppet manifest files] that you provide&mdash;thus affording you all of the advantages typically associated with [Infrastructure as Code][ioc wiki]:
![A screenshot of Boxen&rsquo;s website from February, 2013][boxen 2013 website screenshot]
* You have full control over the apps and files on your machine: you get to choose *what* gets installed, and *where*. (Unlike backup services, which appear to just back up and restore *everything*\.
* Configuration files (such as your `.vimrc`) are committed to a single repository, instead of existing arbitrarily on your hard drive. 
However:
* A brainchild of GitHub, it&rsquo;s no surprise that Boxen has opinions about &ldquo;how to do things&rdquo;. Do you have any `*.dev` entries in your `hosts` file, mapped to local projects? Then brace yourself&mdash;as running `$ boxen` for the first time, will transfigure them into this:
![A screenshot of a local project after running Boxen][boxen nginx octocat]
This sorcery is caused by GitHub&rsquo;s [custom build of NGINX][boxen nginx]: it clobbers `localhost:80` [by default][boxen nginx port 80], and all `*.dev` requests get resolved to it via [dnsmasq][boxen dnsmasq]. Basically, should you not be employed by GitHub, expect to reverse engineer Boxen from time to time.
* Updating your Mac with Boxen can take a *long* time, as Boxen uses [Puppet][puppet] under the hood. Every time you run `$ boxen`, Puppet has to [compile your manifests into a catalog][puppet catalog compilation], before it actually *applies* said catalog to your Mac. In other words, Puppet hangs for (*at least*) a minute, deciding what your &ldquo;perfect&rdquo; Mac should look like. Then&mdash;happy with it&rsquo;s vision&mdash;you&rsquo;ll have to wait some more, whilst Puppet goes about actually &ldquo;making it so&rdquo;.
* Boxen &ldquo;vendor-locks&rdquo; you into using it&mdash;it sits in between you and a plethora of open-source tools like Homebrew. This means that instead of configuring Homebrew [the Homebrew way][homebrew bundle], you have to configure it [the Boxen way][boxen homebrew]&#8482;. Firstly of all, this renders your configuration useless outside of the realm of Boxen. Second, your ability to use open-source updates is limited by how fast Boxen can implement them.
* [Keeping][boxen upstream merge 1] [up][boxen upstream merge 2]-[to][boxen upstream merge 3]-[date][boxen upstream merge 4] [with][boxen upstream merge 5] [Boxen&rsquo;s][boxen upstream merge 6] [upstream][boxen upstream merge 7] [repository][boxen upstream merge 8] [is][boxen upstream merge 9] [hard][boxen upstream merge 10]: every now and again, you should pull the [upstream project][boxen upstream] into your [fork][boxen fork]&mdash;to keep your Mac up-to-date. However, my experience of this hasn&rsquo;t been so smooth; like with all the merge conflicts I&rsquo;ve had to resolve, or when package managers (like `$ pip` and `$ brew`) started to fail randomly. [Shared module][boxen shared modules] updates have also been known to break things&hellip; all of which makes pulling updates, somewhat of a chore.
* Very verbose (unclear) output.
* Homebrew was not installed to the default place, brew doctor was frustrating.
* Randomly work some days, randomly stop other times.
* Updating your Mac with Boxen can take a *long* time, as Boxen uses [Puppet][puppet] under the hood. Every time you run `$ boxen update`, Puppet has to [compile your manifests into a catalog][puppet catalog compilation], before it actually *applies* said catalog to your Mac. In other words, Puppet hangs for (*at least*) a minute, deciding what your &ldquo;perfect&rdquo; Mac should look like. Then&mdash;happy with it&rsquo;s vision&mdash;you&rsquo;ll have to wait some more, whilst Puppet goes about actually &ldquo;making it so&rdquo;.
* [Keeping][boxen upstream merge 1] [up][boxen upstream merge 2]-[to][boxen upstream merge 3]-[date][boxen upstream merge 4] [with][boxen upstream merge 5] [Boxen&rsquo;s][boxen upstream merge 6] [upstream][boxen upstream merge 7] [repository][boxen upstream merge 8] [is][boxen upstream merge 9] [hard][boxen upstream merge 10]: every now and again, you should pull the [upstream project][boxen upstream] into your [fork][boxen fork]&mdash;to keep your Mac up-to-date. However, my experience of this hasn&rsquo;t been so smooth; like with all the merge conflicts I&rsquo;ve had to resolve, or when package managers (like `$ pip` and `$ brew`) started to fail randomly. [Shared module][boxen shared modules] updates have also been known to break things&hellip; all of which makes pulling updates, somewhat a chore.
* Interestingly, the last "nail in the coffin" didn&rsquo;t come from me; [it came from GitHub themselves][github drop boxen].

[backblaze]: https://www.backblaze.com/

[boxen 2013 website screenshot]: /images/boxen-website-2013-02-18.png

[boxen dnsmasq]: https://github.com/boxen/puppet-dnsmasq
[boxen dnsmasq dev requests]: https://github.com/boxen/puppet-dnsmasq/blob/master/templates/dnsmasq.conf.erb#L5:L6

[boxen fork]: https://github.com/kieran-bamforth/our-boxen

[boxen homebrew]: https://github.com/boxen/puppet-homebrew

[boxen nginx]: https://github.com/boxen/puppet-nginx
[boxen nginx octocat]: /images/boxen-nginx-octocat.png
[boxen nginx port 80]: https://github.com/boxen/puppet-nginx/blob/master/manifests/init.pp#L5

[boxen minecraft]: https://github.com/boxen/puppet-minecraft

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

[github drop boxen]: https://github.com/boxen/boxen/issues/197 "GitHub announced they were no longer maintain Boxen"

[homebrew bundle]: https://github.com/Homebrew/homebrew-bundle

[ioc wiki]: https://en.wikipedia.org/wiki/Infrastructure_as_Code

[mikemcqauid]: https://github.com/MikeMcQuaid

[puppet]: https://puppet.com/
[puppet catalog compilation]: https://docs.puppet.com/puppet/4.9/subsystem_catalog_compilation.html
[puppet manifest files]: https://docs.puppet.com/puppet/latest/lang_summary.html#files

[remove nginx dnsmasq]: https://github.com/kieran-bamforth/our-boxen/commit/9b598e979db5adfc0fe1796b487f242f63c0f95d
