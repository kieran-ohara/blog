---
layout: post
title:  Lessons learned from 1000 dotfile commits.
---

Recently I made the 1000 commits to my dotfiles, and decided to
mark the occasion by
[open-sourcing them](https://www.github.com/kieran-bamforth/dotfiles)
gradually. An unexpected nostalgia came while browsing the 2-year-old git
log; workflow revolutionising patterns, learnings and tools evolved in place
of which some I'd like to share here.

_Fair warning: this is more my dotfile "philosophy" over a_
Top 10 list of tools that will change your life!™ _Whilst I'm not against such
list, it would take me a ~~long~~ infinite time to write **and** be outdated if
I finished, so ¯\\_(ツ)_/¯._

## Source-control and experiment with your workflow.

I make the case if you find a tool difficult to install and/or configure,
you'll be reluctant to learn how to use it—if at all. Take for instance
[Karabiner](https://pqrs.org/osx/karabiner/): whilst it makes it super-easy to
remap the keys on your keyboard, it has a tedious interface and a [complex
configuration
file](https://github.com/kieran-bamforth/dotfiles/blob/master/.config/karabiner/karabiner.json)
to match—I don't fancy setting it up on every machine I use. This is a shame,
as I found remapping Caps-Lock really compliments my workflow. Fortunately for
us, configuration files can be kept under source-control, meaning:

- We can configure tools once, and copy the configuration everywhere.
- We can afford to experiment with different settings, by branching, merging
    and reverting changes as needed.
- Remapping the Caps-Lock key becomes frictionless!

In my experience, experimentation and practice help distinguish the
experts from intermediates. I don't claim to be a "command-line expert", but I
know the safety of a consistent yet evolving workflow has bolstered my personal
productivity; swapping clunky IDEs / GUIs for small, sharp tools has become a
fun hobby of mine (really).

This "hobby" is made even easier with the help of [Homebrew](https://brew.sh). I
maintain a [Brewfile](https://github.com/kieran-bamforth/dotfiles/blob/master/.Brewfile)
that lists all of the tools and apps I use. The pain and friction of keeping
tools in sync across machines is now removed thanks to `$ brew bundle
--global`. Needless to say, this encourages me to experiment and explore more
tools, and so the cycle continues.

## Plugins can help you learn.

I make heavy use [ZShell](https://github.com/zsh-users/zsh),
[Tmux](https://github.com/tmux/tmux) and [Vim](https://github.com/vim/vim); a
comprehensive but hard-to-learn set of tools. I owe my adoption of these to
open-source plugins, as they provided me with the quick gratification I needed
to learn them.

That said, I don't want to commit plugins to my dotfiles, as that would mean
maintaining them. Instead, a good plugin-manager should install, upgrade and
remove a list of plugins which I provide. The following table shows the
plugin-managers I use, with their respective plugin lists. Remember to commit
these lists to source-control for quick n' easy experimenting!

| Tool   | Plugin Manager                                                 | Plugin List                                                                              |
| ---    | ---                                                            | ---                                                                                      |
| macOS  | [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle) | [.Brewfile](https://github.com/kieran-bamforth/dotfiles/blob/master/.Brewfile)           |
| Tmux   | [TPM](https://github.com/tmux-plugins/tpm)                     | [.tmux.conf](https://github.com/kieran-bamforth/dotfiles/blob/master/.tmux.conf#L36-L41) |
| ZShell | [Antigen](https://github.com/zsh-users/antigen)                | [.antigenrc](https://github.com/kieran-bamforth/dotfiles/blob/master/.antigenrc#L1-L20)  |
| Vim    | [vim-plug](https://github.com/junegunn/vim-plug)               | [.vimrc](https://github.com/kieran-bamforth/dotfiles/blob/master/.vimrc#L4-L54)          |
|        |                                                                |                                                                                          |

## Sharpen the knife.

A chef wouldn't cut meat with a blunt knife—that would be both dangerous and
counterproductive. Like chefs, we too must sharpen our knives; by being mindful
of our workflow and cutting out any non-essential key presses or mouse clicks.
Simply, dotfiles are to developers what the knife is to the chef.

Enough metaphor—plugins are great but will only get you so far. They abstract
the underlying tool away from you, meaning:

- If your plugin breaks, you'll not be much further than a new starter
    (I suffered a [ZSH key binding](https://github.com/kieran-bamforth/dotfiles/blob/master/.zshrc#L56-L58)
    _way_ longer than I should have), and
- The plugin is optimised for the plugin's _author's_ workflow—not your own. We
    must therefore learn how to reflect.

Now I'm not saying "become a plugin developer" but I am saying think like one.
If you are like me (or indeed every other developer), you'll probably type a lot
of commands into a shell. What ones do you use the most? Which ones are _painful_
to use? Myself, I use [Docker](https://www.docker.com/), I am a _huge_ Docker fan
—but [that CLI](https://docs.docker.com/engine/reference/run/)...  there's far
too much typing involved. But it turns out computers are good at automating—they
can do the boring typing faster than we ever could:

The smallest unit of automation I found—and indeed the quickest way to sharpen
any knife, is with the humble `alias` command. Instead of typing `$ docker
ps -aqf "status=exited" | xargs docker rm`, [this
one liner](https://github.com/kieran-bamforth/dotfiles/blob/master/utilities.sh#L28)
allows me to type `$ dkrmoc`, a mnemonic for `docker remove old containers`—a
42 character saving. This is quite fortunate, as I like _not_ having RSI.

As you get good at reflecting on and automating your workflow, you'll inevitably
reach a point where vanilla bash is not enough. This is the point to start
searching `homebrew` for CLI programs to wrap inside functions (here's an [AWS CLI
Example](https://github.com/kieran-bamforth/dotfiles/blob/master/utilities.sh#L89-L195)
:I don't ever want to work in [AWS
Console](https://medium.com/@miriamschwab/i-love-you-aws-but-your-documentation-and-support-sucks-enormously-192e7d9b671d0!))
. Just remember to commit any shiny new toys you find back into `.Brewfile`.

Now... do we really need the mouse?

## Invest in a window manager, avoid the mouse.

How many times do you press Alt+Tab in a day? Keyboard-savvy users love this
combination, as can cycle through our open applications without our hands
ever leaving the keyboard—but we can do better.

I really dislike having to Alt-Tab more than once, especially if the application
I want to use is in the middle of the stack. To alleviate this pain, I found
[assigning global keyboard shortcuts to my most used
applications](https://github.com/kieran-bamforth/dotfiles/blob/master/.mjolnir/init.lua#L22-L40)
saves _thousands_ of Alt-Tabs every month.

I do this via a macOS Window Manager named
[Mjolnir](https://github.com/sdegutis/mjolnir)—just don't ask me how to
pronounce it! It's easy to configure, and is further extensible with plugins;
I use it to [resize](https://github.com/kieran-bamforth/dotfiles/blob/master/.mjolnir/init.lua#L54-L88)
and [maximize](https://github.com/kieran-bamforth/dotfiles/blob/master/.mjolnir/init.lua#L54-L88)
windows, too.

_When pairing with a co-worker on their machine, this is the tool I miss the most._

## Embrace imperfection.

Does that sound like a TV ad? because I mean it. I've spent a _long_ time
chasing the perfect workflow, with perfect dotfiles. This time is spent
pondering:

- What keyboard shortcut should I bind to?
- Is there a better keyboard shortcut?
- Am I using the _correct_ plugin?
- Is there a better plugin?
- Am I using too many plugins?
- What will other people think of the setup I have?
- et. al.

I can whole-heartedly tell you this is all energy wasted. Firstly, _few_ people
will GAF about your dotfiles. Secondly, they will never be perfect.

As you evolve your workflow, tools and style; so too will your dots. In this regard
they are permanently transient, a digital extension of yourself that thinks of
"what am I doing?" as opposed to "how do I do it?". Perfection is the enemy of
productivity—it took me 6 months to write this blog post.

## Go dots.

If you've read this far—thanks for entertaining me! I can't imagine it was a
_fun_ read unless you're keen on workflow, productivity and/or tooling (I happen
to :heart: all 3). If you're new to all this, I hope it encourages you to keep
on experimenting, and offers a glimpse down a well-trodden path (you're
productivity is going to sky rocket!).

If you know all this stuff and I haven't offered you anything new... I find great
satisfaction in sharing this stuff with less experienced colleagues. You could
be responsible for an "aha!" moment somebody _gets_ the CLI, and thereby sets off
on their own dotfile adventure. Maybe you could share your own tips? Maybe you could...
_share this article_?

Obligatory plug done, I call that a day.

<style>
table {
    width:100%;
}
</style>
