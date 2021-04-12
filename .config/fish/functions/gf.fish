function gf
  if git rev-parse HEAD > /dev/null 2>&1
    set -l path (git -c color.status=always status --short | \
                 fzf -m --ansi --nth 2..,.. \
                   --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' | \
                 cut -c4- | sed 's/.* -> //')
    commandline -- $path
    commandline -f repaint
  end
end
