---
layout: post
title:  One thousand dotfile commits.
---

I made 1000 commits to my private dotfiles, today I&rsquo;m
[open-sourcing](https://www.github.com/kieran-bamforth/dotfiles) them.

## The terminal and you :heart_eyes:.

God love the terminal, the Swiss-army knife in your developer toolbox&hellip;

Do you remember the first time you set eyes on it? The empty emptiness of no
GUI? The cursor blinking expectantly next to your name? The power to do
_anything_ should you remember a few, cryptic mnemonics?

Fast forward&mdash;you&rsquo;ve been in the industry a year now. You can&rsquo;t
remember what the fuck IDE you used/raved on about in university (was it
[Coda](https://panic.com/coda/)? [Sublime Text](https://www.sublimetext.com/)?)
Regardless, big guns [Jetbrains](https://www.jetbrains.com/) has come out, and
there&rsquo;s an absolute _plethora_ of buttons for you to click and point
at (right after the splash screen has passed).

I started making conscious effort to save the dotfiles since 2015, and here are
some things I learned:

## Automate your system setup.

When starting a new job, I've known it to be the case where it takes
developers days to get their machines setup. Don&rsquo;t be that developer!

## Stop worrying and learn to love fuzzy finders.

I'm going to make the assumption you have lots of projects on your machine, and
because of this, you find yourself jumping in and out of directories in terminal
sessions. Imagine how much time and clarity could be gained if you didn't have
to care about the exact names and whereabouts of individual files?

This is the scenario where investing in a decent "fuzzy finder" pays off
in _dividends_. If you are familiar with _VSCode_'s "Command Palette" this is
conceptually similar; You summon a fuzzy finder using a key-binding, and then
start typing the name of the file or directory you want to go to. The fuzzy
finder will narrow your search down as you type, so that once it is highlighted,
you can hit enter and jump to right to it.

Junegunn's [FZF](https://github.com/junegunn/fzf) is an example of such tool,
and is one of the few tools that can genuinely boost your productivity to new
heights. It can be installed with Homebrew so demands little effort from you to
get going, but once you become accustomed to it you'll probably start checking
out [more things it can fuzzy find](https://github.com/junegunn/fzf/wiki/Examples)
and how to [integrate it with other tools](https://github.com/junegunn/fzf.vim).

## Invest in a window manager.

How many times do you press Alt+Tab in a day? Keyboard-savvy users love this
combination, as we can cycle through our open applications without our hands
ever leaving the keyboard.

But we can do better.

I really dislike having to Alt-Tab more than once—especially if the application
I want to jump to is in the middle of the stack. To alleviate this pain, I found
that assigning global keyboard shortcuts to my most used applications saves
_thousands_ of Alt-Tabs every month.

I do this via a macOS Window Manager named
[Mjolnir](https://github.com/sdegutis/mjolnir)—just don't ask me how to
pronounce it! Here I have [mapped most keys to an
application](https://github.com/kieran-bamforth/dotfiles/blob/master/.mjolnir/init.lua#L22-L40),
and love being able to summon any app I want to the foreground with just _one_ keyboard
shortcut.

Also note in the same file, I use Mjolnir to [resize the foreground window to
half of the screen size](https://github.com/kieran-bamforth/dotfiles/blob/master/.mjolnir/init.lua#L54-L88)
using Vim's _H/J/K/L_ convention. Finally, I can [full-size the foreground
window](https://github.com/kieran-bamforth/dotfiles/blob/master/.mjolnir/init.lua#L54-L88),
too!

## Ask for help
