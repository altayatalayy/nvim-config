local status_ok, notify = pcall(require, 'notify')
if not status_ok then return end

vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end
    notify(msg, ...)
end
