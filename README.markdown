## Aaron Mahan's dotfiles.

### Installation

To install into your home directory (will only work if ```~/dotfiles``` directory doesn't exist):

```
git clone --recursive https://github.com/3xp0n3nt/dotfiles.git ~/dotfiles
```

Most of my vim plugins are git submodules. See [below](https://github.com/3xp0n3nt/dotfiles#vim). Git submodules are recursive in nature. The ```--recursive``` flag tells git to recursively clone into any submodule directories, any submodules of submodules, and so on. Without this flag, all submodule directories would be empty.

Then run the installation script:
(WARNING: Please be smart and review what will happen before running!)

```
cd dotfiles
./install.sh
```

The installation script currently does the following:

- Symlinks dotfiles to $HOME directory.
- Prompts you to create empty ~/.extra & ~/.gitconfig_local (optional).
- Sources dotfiles/bash_profile for shell environment configuration.
- Sources dotfiles/macos for MacOS configuration.
- Sources dotfiles/brew.sh, which installs Homebrew & uses it to install
  various applications, & configures custom file associations with Duti.

### Vim

#### Plugins

Most of my vim plugins are git submodules, loaded automatically by the [pathogen](https://github.com/tpope/vim-pathogen) plugin from the vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle) subdirectory. Interestingly, pathogen itself is a git submodule inside vim/[bundle](https://github.com/3xp0n3nt/dotfiles/tree/master/vim/bundle). You can learn more [here](https://github.com/tpope/vim-pathogen/blob/master/README.markdown). The author of pathogen, [Tim Pope](http://tpo.pe), calls this setup "getting crazy." And he doesn't like to get crazy. But I do ;-).

To update all of vim's submodule plugins at once:

```
cd dotfiles
git submodule foreach git pull origin master
```

To install a new vim plugin as a git submodule into dotfiles/vim/bundle/ (assuming it's hosted on github.com):

```
cd dotfiles
git submodule add git://github.com/[username]/[repository-name].git vim/bundle/[desired-plugin-directory-name]
```

#### vimrc

vimrc is configured to allow itself to be quickly edited and re-loaded from within vim using the following keystrokes (in normal mode):

```,ev``` Edit vimrc in a split window.

```:wq``` Save and close vimrc.

```,sv``` Source vimrc (re-load with latest changes).

This allows you to immediately see the effects of a change to .vimrc in your current vim session.

### Git

gitconfig:

~/.gitconfig_local will be included in gitconfig if it exists. This is where you can put personal settings that should not be committed to a public gitconfig (such as this one). For instance:

```
[user]
  name = First Last
  email = your@email.com
[credential]
  helper = osxkeychain
```

gitignore_global:

```gitignore_global``` cannot be displayed properly in the GitHub preview window ever since I added two literal ```^M``` (aka ```\r```, or carriage return) characters to the OS X ```Icon```
rule, so that git will correctly ignore OS X-generated ```Icon\r``` files (that deceptively appear as
```Icon?```'s). You can check out [this](http://blog.bitfluent.com/post/173740409/ignoring-icon-in-gitignore) blog post for more
information. (Side note: to create a literal ```^M``` in vim, type ```<ctrl>v <ctrl>m``` from insert mode.)

You can view my ```gitignore_global``` correctly in it's [raw](https://raw.github.com/3xp0n3nt/dotfiles/master/git/gitignore_global) form (although you still won't be able to see the literal ```^M``` 's.).

### Extra

```~/.extra``` will be sourced in bash_profile if it exists. This is where you can keep personal settings that shouldn't be uploaded to a public repository. For example:

```
GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="you@here.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

### Notes

Many of these dotfiles are customized for MacOS High Sierra. You may need to modify them for your specific OS.

My collection of dotfiles is still in its infancy. I am inspired, however, by
Mathias Bynens' impressive [collection](https://github.com/mathiasbynens/dotfiles) of collaborative dotfiles.

This README file is named ```README.markdown``` to indicate that it uses [GitHub-flavored markdown](http://github.github.com/github-flavored-markdown).
