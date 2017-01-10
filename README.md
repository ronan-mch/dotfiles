# My dotfiles
This is a repo for managing dotfiles across computers inspired by [this blog post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

## Usage

```bash
git clone git@github.com:ronan-mch/dotfiles.git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config co # will cause conflicts with your local dotfiles
```


