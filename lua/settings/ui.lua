local o = vim.opt

o.termguicolors = true 			    -- 24-bit color mode
o.showmode = true                   -- Don't show modes on statuslines
o.fillchars:append({ eob = " " })   -- Removes the '~' as the end-of-buffer marker
                                    -- Some options:
                                    --  eob     = " ",
                                    --  fold    = " ",
                                    --  diff    = "/",
                                    --  msgsep  = "‾",
