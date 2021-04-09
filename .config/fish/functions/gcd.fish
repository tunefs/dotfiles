function gcd
  set -l ghqroot (ghq root)
  set -l dir (ghq list | fzf --query="$argv[1]" --preview "bat --line-range :80 $ghqroot/{}/README.*")
  if test -n "$dir"
    cd (ghq root)/"$dir"
  end
end
