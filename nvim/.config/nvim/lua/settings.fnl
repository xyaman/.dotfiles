(vim.cmd.colorscheme "oh-lucy-evening")

(set vim.opt.number true)
(set vim.opt.relativenumber true)

(vim.api.nvim_create_autocmd
    "TextYankPost"
    {:desc "Highlight fennel"
     :callback
        (fn [] (vim.hl.on_yank
            {:priority 250
             :timeout 40}))})

(vim.filetype.add
  {:pattern {".*/hpyr/.*%.conf" "hyprland"}
   :extension {:cgi "php"}})
