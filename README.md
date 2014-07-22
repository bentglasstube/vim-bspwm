# Navigation for vim and bspwm

This plugin is based on Chris Toomey's [vim-tmux-navigator][1].  It allows vim
to forward messages about changing windows on to bspwm if you try to move
beyond the edge of vim.  This ultimately allows to to navigate vim windows with
the same keybindings you use for navigating bspwm windows.

[1]: https://github.com/christoomey/vim-tmux-navigator

## Usage

This plugin provides the following commands which allow you to move between vim
panes and bspwm windows seamlessly:

  * `BspwmNavigateLeft`
  * `BspwmNavigateUp`
  * `BspwmNavigateDown`
  * `BspwmNavigateRight`

## Installation

### vim

If you don't have a preferred installation method, I recommend using
[pathogen][2].  If you have pathogen set up, just do the following:

    cd ~/.vim/bundle
    git clone https://github.com/bentglasstube/vim-bspwm.git

This plugin will bind some keys to make make the bspwm script work properly.
If you wish to change these, you will also have to edit the script.

### bspwm

This script requires `xorg-xprop`.  Hopefully it can be found in the package
manager for your favorite distribution.

Presumably you are using `sxhkd` to manage your keybindings.  If you are using
something else, you are on your own but the instructions should be similar.

There in an included bash script in script/winmove that will forward the
commands to vim if it detects that the currently focused window is running vim.
I use something like the following in my sxhkd config:

    @super + {h,j,k,l}
      /home/alan/.vim/bundle/vim-bspwm/script/winmove {left,down,up,right}

## Configuration

There isn't really anything configurable about this plugin.  If you have some
idea for what to configure please do let me know or send a pull request.

## Bugs

Please report any bugs on the [GitHub issue tracker][3] and I will do my best
to fix them.

## Contributing

I'll be happy to look at any pull requests or patches or whatever kind of thing
you feel compelled to send me.

## License

This software is licensed under the MIT license.  See LICENSE for details.
