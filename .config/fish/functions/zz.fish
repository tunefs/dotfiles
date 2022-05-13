function zz
  set -l dir (zoxide query -l | fzf-tmux --query="$argv[1]")
  if test -n "$dir"
    cd "$dir"
  end
end

