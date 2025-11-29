#!/bin/bash

# Git Aliases Configuration Script
# Run this script to apply all git aliases to your global git configuration

# Status shortcuts
git config --global alias.st status
git config --global alias.s 'status -sb'

# Commit shortcuts
git config --global alias.ci commit
git config --global alias.cm 'commit -m'
git config --global alias.ca 'commit --amend'
git config --global alias.can 'commit --amend --no-edit'

# Branch management
git config --global alias.br branch
git config --global alias.bra 'branch -a'
git config --global alias.brd 'branch -d'
git config --global alias.brD 'branch -D'

# Checkout shortcuts
git config --global alias.co checkout
git config --global alias.cob 'checkout -b'
git config --global alias.com 'checkout main'
git config --global alias.cod 'checkout develop'

# Diff shortcuts
git config --global alias.df diff
git config --global alias.dfc 'diff --cached'
git config --global alias.dfs 'diff --stat'

# Log shortcuts
git config --global alias.l 'log --oneline'
git config --global alias.lg 'log --oneline --graph --decorate'
git config --global alias.lga 'log --oneline --graph --decorate --all'
git config --global alias.ll "log --pretty=format:'%C(yellow)%h%Creset %C(cyan)%ad%Creset | %s%C(green)%d%Creset %C(bold blue)[%an]%Creset' --date=short"
git config --global alias.lol "log --graph --pretty=format:'%C(yellow)%h%Creset%C(green)%d%Creset %s %C(bold blue)(%an, %ar)%Creset' --abbrev-commit"

# Remote shortcuts
git config --global alias.rv 'remote -v'
git config --global alias.ra 'remote add'
git config --global alias.rr 'remote remove'

# Push/Pull shortcuts
git config --global alias.ps push
git config --global alias.psu 'push -u origin'
git config --global alias.psf 'push --force-with-lease'
git config --global alias.pl pull
git config --global alias.plr 'pull --rebase'

# Fetch shortcuts
git config --global alias.f fetch
git config --global alias.fa 'fetch --all'
git config --global alias.fp 'fetch --prune'

# Rebase shortcuts
git config --global alias.rb rebase
git config --global alias.rbi 'rebase -i'
git config --global alias.rbc 'rebase --continue'
git config --global alias.rba 'rebase --abort'

# Stash shortcuts
git config --global alias.ss stash
git config --global alias.ssa 'stash apply'
git config --global alias.ssp 'stash pop'
git config --global alias.ssl 'stash list'
git config --global alias.ssd 'stash drop'

# Add shortcuts
git config --global alias.a add
git config --global alias.aa 'add -A'
git config --global alias.ap 'add -p'

# Reset shortcuts
git config --global alias.rs reset
git config --global alias.rsh 'reset --hard'
git config --global alias.rss 'reset --soft'

# Cherry-pick shortcuts
git config --global alias.cp cherry-pick
git config --global alias.cpc 'cherry-pick --continue'
git config --global alias.cpa 'cherry-pick --abort'

# Merge shortcuts
git config --global alias.mg merge
git config --global alias.mgn 'merge --no-ff'
git config --global alias.mga 'merge --abort'

# Worktree shortcuts
git config --global alias.wt worktree
git config --global alias.wta 'worktree add'
git config --global alias.wtl 'worktree list'
git config --global alias.wtp 'worktree prune'

# Useful commands
git config --global alias.undo 'reset --soft HEAD~1'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.discard 'checkout --'
git config --global alias.last 'log -1 HEAD'
git config --global alias.aliases 'config --get-regexp alias'
git config --global alias.contributors 'shortlog -sn'

# Advanced shortcuts
git config --global alias.amend 'commit --amend --no-edit'
git config --global alias.fixup 'commit --fixup'
git config --global alias.squash 'commit --squash'
git config --global alias.graph 'log --graph --all --decorate --oneline'
git config --global alias.today "log --since=midnight --author='\$(git config user.name)' --oneline"
git config --global alias.yesterday "log --since=yesterday.midnight --until=midnight --author='\$(git config user.name)' --oneline"

echo "✓ Git aliases applied successfully!"