function rgv
    if test (count $argv) -eq 0
        echo "Usage: rgv <keyword>"
        return 1
    end
    set -l query $argv
    set -l result (rg --line-number --no-heading --color=always $query | fzf --ansi --delimiter :)
    if test -z $result
	echo "No results found."
	return 1
    end
    set -l file (echo $result | cut -d: -f1)
    set -l line (echo $result | cut -d: -f2)
    set -l cmd "vi +$line $file"
    echo $cmd | pbcopy
    echo $cmd
end
