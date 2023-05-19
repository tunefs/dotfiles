(set-language-environment "Japanese")
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(material-theme nordless-theme atom-one-dark-theme hybrid-reverse-theme nord-theme ##))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-frame-parameter nil 'alpha 95)
(load-theme 'material t)
(tool-bar-mode 0)
;(menu-bar-mode 0)
(setq ns-command-modifier (quote meta))
(global-set-key [(control ?h)] 'delete-backward-char)
(global-set-key (kbd "S-SPC") 'set-mark-command)
(set-frame-font "FiraCode Nerd Font-13")
;(set-frame-font "JetBrainsMono Nerd Font Mono-13")
