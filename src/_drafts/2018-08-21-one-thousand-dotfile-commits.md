---
layout: post
title:  Lessons learned from 1000 dotfile commits.
---

<style>
table {
    width:100%;
}
</style>

Recently I made the 1000 commits to my dotfiles, and decided to
mark the occasion by
[open-sourcing them](https://www.github.com/kieran-bamforth/dotfiles)
gradually. An unexpected nostalgia came while browsing the 2-year-old git
log; workflow revolutionising patterns, learnings and tools evolved in place
of which I'd like to share some here.

_Fair warning: this is more a dotfile "philosophy" post over_
Top 10 list of tools that will change your life™! _Whilst I'm not against such
list, it would take me a ~~long~~ infinite time to write **and** be outdated by the
time I finished, so ¯\\_(ツ)_/¯._

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

## Notes

Reflect on the way you do things. Is there an easier way?
	Use your computer to do the boring work faster than you ever could.
		Smallest unit of automation is the alias,
			For example, I find docker commands are too long, to type, so I have lots of docker aliases
		When more advanced automation is needed it’s worth finding CLI tools that can be wrapped in functions.
			Especially if said CLI tools embrace the Unix philosophy
				Do one thing, and do it well.
				Write programs to work together.
				Write programs to handle text streams, because that is a universal interface.
				Bad examples include Boxen, Powerline and YouCompleteMe).
			Examples include AWS CLI & ssh, gitconfig, go-jira
		Saving keyboard presses saves time/RSI. Dotfiles kill mice.
	Learn how to learn.
		Plugins only get you so far.
			They abstract a lot of details away. What problems might arise?
				If something is broken and you don't know the fix
				If you want to expand a tool (such as ALE + LSP)
			Plugins often come about from _other_ people's workflows, not your own.
		Avoid recreating the wheel, use man pages (for Tmux, vim) / built in help / tldr.
	Dotfiles are the digital extension of yourself.
		They're your secret sauce.
		Dotfiles evolve over time with your personal style.
			They are permanently transient.
			They are never perfect.
			Perfection is the enemy of productivity.
			Unix Philosophy: Don't hesitate to throw away the clumsy parts and rebuild them.
		Allow you to work faster by focusing on "what" you're doing instead of the "how".
	Sharpen the knife—A chef would not make a cut with a blunt blade.
