function gcd
  set -l ghqroot (ghq root)
  set -l dir (ghq list | fzf --query="$argv[1]" --bind "ctrl-q:toggle-preview" --preview "bat --line-range :80 $ghqroot/{}/README.*" --preview-window=hidden)
  # set -l dir (fd -u --type d --max-depth 4 --search-path $ghqroot --format '{//}' '^.git$' | sed -e "s!$ghqroot/!!" | sort | fzf --query="$argv[1]" --preview "bat --line-range :80 $ghqroot/{}/README.*")
  if test -n "$dir"
    cd "$ghqroot/$dir"
  end
end
