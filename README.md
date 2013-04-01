## Aaron Mahan's dotfiles.

### Installation

```
git clone git@github.com:3xp0n3nt/dotfiles.git
cd dotfiles
```

Then symlink the files into your $HOME directory, prepending a dot, for example:

```
ln -s /Users/[yourname]/dotfiles/bash_profile /Users/[yourname]/.bash_profile
```

I plan to write an installation script in the future.

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
