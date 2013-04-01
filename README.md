Aaron Mahan's dotfiles.

Note: gitignore_global no longer displays properly in the GitHub file preview
window after I added two literal carriage return characters to the OS X 'Icon'
rule, so that git will correctly ignore OS X generated 'Icon' files that end in
a literal carriage return character (although they can deceptively appear as
'Icon?', they are actually 'Icon\r'). You can check out this blog post for more
information:
http://blog.bitfluent.com/post/173740409/ignoring-icon-in-gitignore

If you want to view the correct gitignore_global, you can go here:
https://raw.github.com/3xp0n3nt/dotfiles/master/git/gitignore_global

To apply custom OS X settings, run
```
./.osx
```

My collection of dotfiles is still in its infancy. I am inspired, however, by
Mathias Bynens' impressive collection of collaborative dotfiles, found here:

https://github.com/mathiasbynens/dotfiles
