return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    config = function()
        local status_ok, lualine = pcall(require, "lualine")
        if not status_ok then
            return
        end

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "Recording @" .. recording_register
            end
        end

        vim.api.nvim_create_autocmd("RecordingEnter", {
            callback = function()
                lualine.refresh({
                    place = { "statusline" },
                })
            end,
        })

        vim.api.nvim_create_autocmd("RecordingLeave", {
            callback = function()
                -- This is going to seem really weird!
                -- Instead of just calling refresh we need to wait a moment because of the nature of
                -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
                -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
                -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
                -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
                local timer = vim.loop.new_timer()
                timer:start(
                    50,
                    0,
                    vim.schedule_wrap(function()
                        lualine.refresh({
                            place = { "statusline" },
                        })
                    end)
                )
            end,
        })

        lualine.setup({
            options = {
                icons_enabled = true,
                theme = "tokyonight",
                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                disabled_filetypes = {},
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = function(str)
                            local rv = show_macro_recording()
                            print(rv)
                            if rv == "" then
                                return str
                            end
                            return rv
                        end,
                    },
                },
                lualine_b = { "branch" },
                lualine_c = {
                    {
                        "filename",
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                    },
                    "encoding",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                        "filename",
                        file_status = true, -- displays file status (readonly status, modified status)
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    },
                },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { "fugitive" },
        })
    end,
}
