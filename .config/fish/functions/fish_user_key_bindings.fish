function fish_user_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings --no-erase insert
  bind -s --preset -M insert \cg "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
  fzf_key_bindings
end
