function gbr
  set -l branch (git branch -vv | sed 's/^..//' | fzf-tmux --query="$argv[1]" | awk '{print $1;}')
  if test -n "$branch"
    git checkout "$branch"
  end
end
