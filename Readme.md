### Pretty basic configurations of dwm and st I use on my Debian Buster

### Screenshots

### Stuffs in this repository

1. **.vimrc** = Vimrc configs for vim

2. **.bashrc** = Some bashrc configuration

3. **suckless/dwm and st** = Dynamic window manager and suckless terminal

4. **Custom colorschemes for vim** = [gruvbox](https://github.com/morhetz/gruvbox), [miramare](https://github.com/franbach/miramare), [iceberg](https://github.com/cocopon/iceberg.vim), [substrata](https://github.com/arzg/vim-substrata) 

5. **System-wide font used** = Fira Code Medium

6. **bonus.sh** = If you wish to download some packages I use on a daily basis, they are included in bonus.sh script. You can run it with either by running setup.sh or running it manually from your shell

7. Wallpaper taken from [Debian art theme->change](https://wiki.debian.org/DebianArt/Themes/Change). Credits to Wilton Gorske

### In `.vimrc`

Using this vimrc, you get;

a. Default Vim colorscheme is set to iceberg (remember to copy vim-colors/iceberg.vim to /usr/share/vim/vim\*/colors/)

b. Turn on spell check with spy(in command mode) and turn off spell check using spn(in command mode)

c. Spell check is turned on automatically for markdown files or files having `.md` extension and default colorscheme for markdown files is set to miramare

d. Page down with space

e. **Miscellaneous:** syntax is enabled, laststatus is set to 0, termguicolors is enabled, noswapfile is set, background is set to dark, relativenumber and numbers are on, fixed termguicolors for st.

f. Although optional, if you're not using w and q for their defined actions, you can map them to save and quit, just uncomment line 5 and 6, save vimrc. Now, you can exit vim with q and save with w. Easy as that.

### Stuffs in `.bashrc and bash_aliases`

a. A few of aliases and file specific color profiles in .bash_aliases for specific file formats.

b. A cs function at the end. Type in `cs /path/to/directory/` and it'll cd to that directory and list out its contents

### DWM configs include

***Patches included***

I've included some patches under `suckless/dwm-6.2/patches/` directory. Currently I've included only one patch pre-installed which is the `pertag` patch. This allows tilling layouts to be maintained as they separately across different tags.

**Customizations**

a. Move across screens with vim keys as well as arrow keys like in i3

b. 
