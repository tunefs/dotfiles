function gcd
  set -l dir (ghq list | fzf --query="$argv[1]")
  if test -n "$dir"
    cd (ghq root)/"$dir"
  end
end
