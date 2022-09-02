function dash
  if test (count $argv) -lt 1
    open dash://
  else if test (count $argv) -eq 1
    open dash://"$argv[1]"
  else
    open dash://"$argv[1]%3a$argv[2]"
  end
end
