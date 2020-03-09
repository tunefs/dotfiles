function zz
  set -l dir (z -l | fzf-tmux --query="$argv[1]")
  if test -n "$dir"
    set dir (echo $dir | sed "s!^.* /!/!")
    cd "$dir"
  end
end

