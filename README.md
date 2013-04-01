## Aaron Mahan's dotfiles.

### Installation

```
git clone --recursive git@github.com:3xp0n3nt/dotfiles.git ~/dotfiles
```

The ```--recrusve``` flag tells git to recursively clone into any submodule directories (since [1.6.5](http://git-scm.com/docs/git-clone/1.6.5)).
For older versions of git, you must run ```git submodule update --init``` in the root dotfiles directory to clone into the submodules, otherwise their directories will be empty.

Then symlink the files into your $HOME directory, prepending a dot to each one. For example:

```
cd ~
ln -s dotfiles/bash_profile .bash_profile
```

I plan to write an installation script in the future.

### Vim

Most of vim's plugins are git submodules, loaded automatically by the the [pathogen](https://github.com/tpope/vim-pathogen) in the vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle) subdirectory. Interestingly, pathogen itself is a git submodule inside vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle) plugin. You can learn more [here](https://github.com/tpope/vim-pathogen/blob/master/README.markdown). The author of the pathogen plugin, [Tim Pope](http://tpo.pe), calls this setup "getting crazy." And he doesn't like to get crazy. But I do ;-).

### Git

```gitignore_global``` cannot be displayed properly in the GitHub preview window ever since I added two literal ```^M``` (aka ```\r```, or carriage return) characters to the OS X ```Icon```
rule, so that git will correctly ignore OS X-generated ```Icon\r``` files (that deceptively appear as
```Icon?```'s). You can check out [this](http://blog.bitfluent.com/post/173740409/ignoring-icon-in-gitignore) blog post for more
information.

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
