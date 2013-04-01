## Aaron Mahan's dotfiles.

### Installation

```
git clone --recursive git@github.com:3xp0n3nt/dotfiles.git
cd dotfiles
```

The ```--recrusve``` flag tells git to include any submodule directories (since [1.6.5](http://git-scm.com/docs/git-clone/1.6.5)).
For older versions of git, you must run ```git submodule update --init``` in the root dotfiles directory to download the submodules, otherwise their directories will be empty.

Then symlink the files into your $HOME directory, prepending a dot, for example:

```
ln -s /Users/[yourname]/dotfiles/bash_profile /Users/[yourname]/.bash_profile
```

I plan to write an installation script in the future.

### Vim

Most of vim's plugins are git submodules, managed by [fugitive](https://github.com/tpope/vim-fugitive) in the vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle) directory. Interestingly, fugitive itself is a git submodule in vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle).

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
