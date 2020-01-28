function zz
  set -l dir (z -l | sed 's!^.* /!/!' | sed "s!^$HOME!~!" | fzf --query="$argv[1]")
  if test -n "$dir"
    set dir (echo $dir | sed "s!^~!$HOME!")
    cd "$dir"
  end
end

