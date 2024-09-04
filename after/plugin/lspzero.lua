local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
    if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { 0 })
    end
    vim.keymap.set("n", "<leader>mv", vim.lsp.buf.rename)
end)

-- here you can setup the language servers

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})
