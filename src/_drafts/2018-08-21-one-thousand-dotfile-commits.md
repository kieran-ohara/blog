---
layout: post
title:  One thousand dotfile commits.
---

Recently I made the 1000th commit to my dotfiles, and decided to
mark the occasion by
[open-sourcing them](https://www.github.com/kieran-bamforth/dotfiles)
gradually (there's a lot of private stuff in there!). An unexpected nostalgia
came about as I browsed the 2-year-old git log; workflow revolutionising patterns,
learnings and tools evolved in front of me which I started to capture here.

- joy of migrating to standard tools
- embracing unix philosophy
- small sharp tools over large ones
- creating then sharing your own tools / dotfiles.
- sharpen the knife

## Automate your system setup.

- Brewfile
When starting a new job, I've known it to be the case where it takes
developers days to get their machines setup. Don&rsquo;t be that developer!

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

## Invest in a window manager.

How many times do you press Alt+Tab in a day? Keyboard-savvy users love this
combination, as we can cycle through our open applications without our hands
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
windows, too!

## Ask for help
