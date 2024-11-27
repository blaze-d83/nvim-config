return {
    'nvim-java/nvim-java',
    config = function()
        require('java').setup()
        require('lspconfig').jdtls.setup({
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "JavaSE-21",
                                path = "/opt/jdk21",
                                default = true,
                            }
                        }
                    }
                }
            }
        })
    end
}
