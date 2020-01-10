function gcd
  set -l dir (ghq list | fzf)
    if test ! -z "$dir"
      cd (ghq root)/$dir
    end
end
