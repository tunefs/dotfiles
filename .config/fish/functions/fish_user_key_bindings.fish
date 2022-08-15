function fish_user_key_bindings
  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
  bind -s --preset \cg cancel
  bind -s --preset -M insert \cg "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char repaint-mode; end"
  bind -s --preset -M visual -m default \cg end-selection repaint-mode
  bind -s --preset -M replace_one -m default \cg cancel repaint-mode
  bind -s --preset -M replace -m default \cg cancel repaint-mode
  fzf_key_bindings
end
