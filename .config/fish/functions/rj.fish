function rj
  rg --json --context 3 "$argv[1]" | delta
end
