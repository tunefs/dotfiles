function gcd
  set -l dir (ghq list | fzf-tmux --query="$argv[1]")
  if test -n "$dir"
    cd (ghq root)/"$dir"
  end
end
