---
layout: post
title:  One thousand dotfile commits.
---

Recently I made the 1000 commits to my dotfiles, and decided to
mark the occasion by
[open-sourcing them](https://www.github.com/kieran-bamforth/dotfiles)
gradually. An unexpected nostalgia came while browsing the 2-year-old git
log; workflow revolutionising patterns, learnings and tools evolved in place
of which I'd like to share some here.

## Source-control & automate your system setup.

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
- We can afford to experiment with different settings, by `branching`, `merging`
    and `reverting` changes as needed.
- Remapping my Caps-Lock key is frictionless!

In my opinion, experimentation and practice are some ingredients needed to distinguish
experts from intermediates. I don't claim to be a "command-line expert", but I
do know the safety of a consistent, evolving workflow has bolstered my personal
productivity; swapping clunky IDEs / GUIs for [small, sharp
tools](https://github.com/kieran-bamforth/dotfiles/blob/master/.Brewfile#L68-L144)
has become a hobby of mine.

## Embrace small, sharp tools. Embrace Unix.

- embracing unix philosophy
- small sharp tools over large ones
- sharpen the knife

## Stop worrying and learn to love fuzzy finders.

I'm going to make the assumption you have lots of projects on your machine, and
because of this, you find yourself jumping in and out of directories in terminal
sessions. Imagine how much time and energy could be saved if you didn't have
to care about the exact names and whereabouts of individual files?

This is the scenario where investing in a decent fuzzy finder pays off
in dividends. If you are familiar with _VSCode_'s Command Palette, this is
conceptually similar: you summon a fuzzy finder using a key-binding, and then
start typing the name of the file or directory you want to go to. The fuzzy
finder will narrow your search down as you type, so that once it is highlighted,
you can hit enter and jump to right to it.

Junegunn's [FZF](https://github.com/junegunn/fzf) is an example of such tool for
your command line, and is one of the few tools that can quickly boost your
productivity to new heights. It can be installed with Homebrew (so demands little
effort to get going), and once you become accustomed to it you'll want to check
out [more things it can find](https://github.com/junegunn/fzf/wiki/Examples)
/ [how to integrate it with other tools](https://github.com/junegunn/fzf.vim).

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

## Ask for help
