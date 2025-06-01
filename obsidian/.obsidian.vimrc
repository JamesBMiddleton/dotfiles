" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk
vmap j gj
vmap k gk

set clipboard=unnamed

unmap <Space>

exmap open obcommand switcher:open
nmap <Space>o :open


exmap search obcommand global-search:open
nmap <Space>g :search


exmap file_tree obcommand file-explorer:open
nmap <Space>e :file_tree

exmap toggle_side obcommand app:toggle-left-sidebar
nmap <Space>E :toggle_side

