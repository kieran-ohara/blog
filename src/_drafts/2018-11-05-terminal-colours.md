---
layout: post
title: Level-up your terminal's colours.
tags: dotfiles
---

Thanks to [/r/unixporn][unixporn], I'm _obsessed_ with good-looking terminals;
a casual browse begets studying your terminal's innards at some point down
the line... Recently I learned how to make my terminals' colours **pop** off the
screen—now I want the same for yours! Consider this post an _ode to your eyes_
for consuming so much internet everyday.

We'll start by querying your terminal; copy and paste the following
commands to learn *how many colours* your terminal can display:

```shell
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
    printf "\n";
}'
```

If you see a smooth rainbow of colours

- Found gruvbox and noticed my colour scheme just did not match
    - italics were not working
    - colour was dimmer
        - set/help termguicolors
        - help xterm-true-color
        - help terminal-options

[ncurses]: https://www.gnu.org/software/ncurses/
[unixporn]: https://www.reddit.com/r/unixporn/
[colour-bar]: https://github.com/kieran-bamforth/dotfiles/blob/30bc0f364a78d426dd42b87015c02d53d9427168/utilities.zsh#L259-L273
