function gt
  if git rev-parse HEAD > /dev/null 2>&1
    git tag --sort -version:refname | fzf --multi --preview-window right:70% --preview 'git show --color=always {} | head -'$LINES
  end
end
