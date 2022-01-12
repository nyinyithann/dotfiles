require'lspconfig'.ocamllsp.setup{
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason" },
    get_language_id = function(_, ftype)
        return language_id_of[ftype]
    end,
    -- root_dir = root_pattern("*.opam", "esy.json", "package.json", ".git")
}
