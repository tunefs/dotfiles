function gl
  if git rev-parse HEAD > /dev/null 2>&1
    set -l hash (git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always | \
                 fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
                   --header 'Press CTRL-S to toggle sort' \
                   --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' | \
                 grep -o '[a-f0-9]\{7,\}')
    commandline -- $hash
    commandline -f repaint
  end
end
