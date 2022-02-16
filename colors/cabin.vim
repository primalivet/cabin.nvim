" clear cache so this reloads changes.
" useful for development
" lua package.loaded['cabin'] = nil
lua package.loaded['cabin.theme'] = nil
lua package.loaded['cabin.colors'] = nil
" lua package.loaded['cabin.util'] = nil
" lua package.loaded['cabin.config'] = nil
lua require('cabin').colorscheme()
