## Aaron Mahan's dotfiles.

### Git

Note: ```gitignore_global``` no longer displays properly in the GitHub file preview
window after I added two literal carriage return characters to the OS X ```Icon\r```
rule, so that git will correctly ignore OS X-generated ```Icon\r``` files that end in
a literal carriage return character, ```^M``` (although they can deceptively appear as
```Icon?```). You can check out [this](http://blog.bitfluent.com/post/173740409/ignoring-icon-in-gitignore) blog post for more
information.

You can view my ```gitignore_global``` correctly in it's [raw](https://raw.github.com/3xp0n3nt/dotfiles/master/git/gitignore_global) form (although you still won't be able to see the literal ```^M``` 's).

### OS X

To apply custom OS X settings, run
```
./.osx
```

### Notes

My collection of dotfiles is still in its infancy. I am inspired, however, by
Mathias Bynens' impressive [collection](https://github.com/mathiasbynens/dotfiles) of collaborative dotfiles.
