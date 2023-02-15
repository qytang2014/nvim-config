vim.cmd [[
    vnoremap <C-c> "+y   "支持在Visual模式下，通过C-c复制到系统剪切板

    """"""""""""""""""""""gtags配置
    " set tags=./.tags;,.tags
    set cscopetag " 使用 cscope 作为 tags 命令
    set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope    

    " enable gtags module
    let g:gutentags_modules = ['gtags_cscope']

    " change focus to quickfix window after search (optional).
    let g:gutentags_plus_switch = 1 

    " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
    let g:gutentags_project_root = ['.root']

    " 所生成的数据文件的名称
    let g:gutentags_ctags_tagfile = '.tags'

    let g:gutentags_file_list_command = 'find . -type f -name "*.java" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.aidl" -o -name ".cxx" -o -name "*.cc" -o -name "*.C"' 

    " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    let g:gutentags_cache_dir = expand('~/.cache/tags') 

    " 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

    " 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
    let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

    " 禁用 gutentags 自动加载 gtags 数据库的行为
    " let g:gutentags_auto_add_gtags_cscope = 0
    """"""""""""""""""""""
]]
