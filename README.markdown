## Aaron Mahan's dotfiles.

### Installation

To install into your home directory (will only work if ```~/dotfiles``` directory doesn't exist):

```
git clone --recursive git@github.com:3xp0n3nt/dotfiles.git ~/dotfiles
```

Most of my vim plugins are git submodules. See [below](https://github.com/3xp0n3nt/dotfiles#vim). Git submodules are recursive in nature. The ```--recursive``` flag tells git to recursively clone into any submodule directories, any submodules of submodules, and so on. Without this flag, all submodule directories would be empty.

Then symlink the files into your $HOME directory, prepending a dot to each one. For example:

```
cd ~
ln -s dotfiles/bash_profile .bash_profile
```

I plan to write an installation script in the future.

### Vim

Most of my vim plugins are git submodules, loaded automatically by the [pathogen](https://github.com/tpope/vim-pathogen) plugin from the vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle) subdirectory. Interestingly, pathogen itself is a git submodule inside vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle). You can learn more [here](https://github.com/tpope/vim-pathogen/blob/master/README.markdown). The author of pathogen, [Tim Pope](http://tpo.pe), calls this setup "getting crazy." And he doesn't like to get crazy. But I do ;-).

To update all of vim's submodule plugins at once:

```
cd dotfiles
git submodule foreach git pull
```

### Git

Replace my username and email in ```gitconfig``` with your own:

```
git config --global user.name  "Your Name"
git config --global user.email "you@here.com"
```

Verify the new settings:
```
git config --global user.name
git config --global user.email
```

```gitignore_global``` cannot be displayed properly in the GitHub preview window ever since I added two literal ```^M``` (aka ```\r```, or carriage return) characters to the OS X ```Icon```
rule, so that git will correctly ignore OS X-generated ```Icon\r``` files (that deceptively appear as
```Icon?```'s). You can check out [this](http://blog.bitfluent.com/post/173740409/ignoring-icon-in-gitignore) blog post for more
information. (Side note: to create a literal ```^M``` in vim, type ```<ctrl>v <ctrl>m``` from insert mode.)

You can view my ```gitignore_global``` correctly in it's [raw](https://raw.github.com/3xp0n3nt/dotfiles/master/git/gitignore_global) form (although you still won't be able to see the literal ```^M``` 's.).

### OS X

To apply custom OS X settings, run
```
./.osx
```

### Notes

Many of these dotfiles are customized for OS X Snow Leopard. You may need to modify them for your specific os.

My collection of dotfiles is still in its infancy. I am inspired, however, by
Mathias Bynens' impressive [collection](https://github.com/mathiasbynens/dotfiles) of collaborative dotfiles.

This README file is named ```README.markdown``` to indicate that it uses [GitHub-flavored markdown](http://github.github.com/github-flavored-markdown).
