# nvim配置项目

  简单梳理说明一下，按需自取, 相对重要的我会用粗体标出来

## 如何使用

  1 将项目clone至 ~/.config/nvim 目录中(注意备份好自己的配置)  
  2 nvim中运行 PlugInstall 命令，然后等待

## 配置结构

```dir
.
├── config
│   ├── common.vimrc         -- 通用的基础配置
│   ├── key.vimrc            -- 快捷键相关配置
│   └── plug.vimrc           -- 插件相关的配置
├── colors
│   └── solarized8_high.vim  -- 高亮主题文件
├── autoload
│   └── plug.vim             -- vim-plug 插件管理工具
├── ftplugin
│   └── markdown.vim         -- 按文件类型的自定义设置(本人只设置了markdown相关的)
├── plugged
│   └── ...                  -- 插件的存放目录
├── snippets                 -- 自定义的snippets补全存放目录
├── file_logs
│   └── ...                  -- 文件修改记录log目录
├── init.vim                 -- 配置文件的总入口
├── coc-settings.json        -- coc的相关配置
└── README.md
```

## common.vimrc 通用基础配置说明

  不额外说明了，有需要直接看 ./config/common.vimrc 的注释

## key.vimrc    快捷键相关配置说明

| 模式   | 键                   | 说明                              |
| ------ | --------             | ---------                         |
| normal | ;                    | :                                 |
| normal | +                    | 数字自增                          |
| normal | _                    | 数字自减                          |
| normal | ,                    | 重复上一次宏操作                  |
| normal | ctrl - j             | 从, 处打断当前行                  |
| normal | \                    | 清除当前搜索词高亮                |
| normal | backspace            | 删除当前词并插入                  |
| insert | ctrl - h(backspace)  | 删除内容置词首                    |
| insert | ctrl - z             | 撤销最后修改并退出编辑            |
| command| ctrl - a             | Home                              |
| command| ctrl - e             | End                               |
| all    | ctrl - s             | 进入替换模式                      |
| normal | S                    | save                              |
| normal | W                    | close                             |
| normal | Q                    | quit                              |
| normal | R                    | 重载配置                          |
| insert | jj                   | esc                               |
| visual | > or tab             | 将代码块右移                      |
| visual | < or shift-tab       | 将代码块左移                      |
| all    | shift - 方向         | 选中文本(类似于在其他编辑器的体验)|
| all    | ctrl - shift + 方向  | 快速移动                          |
| all    | ctrl - u             | 清空本行                          |
| all    | alt - up/down        | 上下移动当前行/块                 |
| all    | alt - d              | 删除当前词                        |
| all    | alt - r              | 删除当前词并插入                  |
| all    | alt - o              | 下方新起一行                      |
| all    | alt - O              | 上方新起一行                      |
| normal | su                   | 左右分屏                          |
| normal | sc                   | 关闭当前窗口                      |
| normal | so                   | 关闭其他所有窗口                  |
| normal | s - left or right    | 聚焦到对应窗口                    |
| normal | s=                   | 将窗口大小置为相同                |
| normal | s,                   | 窗口减小                          |
| normal | s.                   | 窗口增大                          |
| normal | ss                   | 切换到下个buffer                  |
| normal | sp                   | 切换到上个buffer                  |
| all    | alt  - left or right | 左右跳转buffer                    |
| all    | F5                   | 一键运行当前文件                  |
| normal | --                   | 折叠/反折叠                       |
| visual | -                    | 折叠选中内容                      |
| normal | space                | 在行首 第一个非空字符 行尾 跳转   |
| normal | =                    | 格式化当前行                      |
| visual | =                    | 格式化选中内容                    |

PS: 如果需要格式化js和ts代码，请手动安装: npm i js-beautify -g

## plug.vimrc   插件相关的配置说明

### 插件列表

```plug
  Plug 'yianwillis/vimcdoc'             -- 中文vim help文档
  Plug 'terryma/vim-expand-region'      -- 快速选中文本插件
  Plug 'lfv89/vim-interestingwords'     -- 高亮关键词插件
  Plug 'mg979/vim-visual-multi'         -- 虚拟多光标插件
  Plug 'pangloss/vim-javascript'        -- js语法高亮插件
  Plug 'iamcco/markdown-preview.nvim'   -- md 预览插件
  Plug 'neoclide/coc.nvim'              -- coc
  Plug 'voldikss/vim-floaterm'          -- 悬浮终端插件
  Plug 'tpope/vim-dadbod'               -- 数据库可视化工具
  Plug 'kristijanhusak/vim-dadbod-ui'   -- 数据库可视化工具
  Plug 'junegunn/fzf.vim'               -- 文本/文件搜索插件
  Plug 'yaocccc/vim-lines'              -- 自己写的状态栏/标签栏插件
  Plug 'yaocccc/vim-surround'           -- 自己写的快速操作({["'`等的插件
  Plug 'yaocccc/vim-comment'            -- 自己写的快速注释插件
```

### 插件简单说明以及键位绑定

- [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)
  - v 扩展 visual 范围 例如我经常用的 vv 选中当前词，vvv选中"xxx"内的内容
  - V 缩小 sisual 范围

- [lfv89/vim-interestingwords](https://github.com/lfv89/vim-interestingwords)
  - ff 高亮当前词(如果光标在高亮的词上可以用n/N跳转)  再次ff取消高亮
  - FF 取消全部高亮词

- [**mg979/vim-visual-multi**](https://github.com/mg979/vim-visual-multi)
  - 建议到对应的仓库看一下
  - ctrl + up or down， 上下行添加光标(normal模式)(可用w e b $ ^ t f等等操作)
  - ctrl + left or right， 左右添加选中(visual模式)(可用w e b $ ^ t f等等操作)
  - tab 在 normal 和 visual 模式下切换
  - ctrl + d 选中全部当前词
  - ctrl + x 当前位置添加光标
  - ctrl + w 当前词首添加光标
  - q 取消当前光标

- [iamcco/markdown-preview.vim](https://github.com/iamcco/markdown-preview.vim)
  - F5 在浏览器预览markdown

- [**neoclide/coc.nvim**](https://github.com/neoclide/coc.nvim)
  - 建议到对应的仓库看一下
  - 全局的插件列表 let g:coc_global_extensions=[...] 按需添加
  - coc 通用快捷键
    - tab/s-tab 上下 选择候选项
    - gd 跳转到定义
    - gy 跳转到类型
    - K 查看文档
    - ctrl-e 显示错误列表
    - F2 重命名
    - F4 关闭/开启 coc
  - 部分自用的插件的快捷键
    - mm 翻译当前词
    - ( or ) 跳转到上下 git 修改
    - C 展示 git commit or change info
    - leader - g 开启临时 git blame 显示
    - tt 打开 coc-expoler 文件管理器

- [voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)
  - ctrl - t 打开关闭 浮动终端

- [tpope/vim-dadbod](https://github.com/tpope/vim-dadbod)
- [kristijanhusak/vim-dadbod-ui](kristijanhusak/vim-dadbod-ui)
  - :DBUI 来使用 数据库可视化工具
  - 添加链接: let g:dbs = [{ 'name': 'connection_name', 'url': 'mysql://user:password@host:port' }]
  - 注意 url内的东西需要url_encode

- [**junegunn/fzf.vim**](https://github.com/junegunn/fzf.vim)
  - 注意要配合ag使用，请自己手动安装: the_silver_searcher fd bat
  - ctrl - a 全局文本搜索
  - ctrl - l 当前文件文本搜索
  - ctrl - p 全局文件搜索
  - ctrl - h 历史文件搜索
  - ctrl - g git变更文件搜索
  - ctrl - n/p 补全搜索历史
  - ctrl - / 关闭/开启preview

- **yaocccc/...  自己写的三个插件的使用说明**
  - 建议到对应的仓库看一下
  - [yaocccc/vim-lines](https://github.com/yaocccc/vim-lines)
    - 采用默认配置即可
  - [yaocccc/vim-surround](https://github.com/yaocccc/vim-surround)
    - visual模式下 '"`({[]}) 会用对应的符号将选中区域包裹起来
    - normal模式下 ys + '"`({[]}) 会用对应的符号将当前词包裹起来
    - normal模式下 yS + '"`({[]}) 会用对应的符号将当前行包裹起来
    - normal模式下 ds + '"`({[]}) 会删除离光标最近的符号
    - normal模式下 cs + 符号1 + 符号2 会将 最近的 符号1 改为 符号2
  - [yaocccc/vim-comment](https://github.com/yaocccc/vim-comment)
    - normal模式下 ?? 行注释/反注释当前行
    - visual模式下 /  行注释/反注释当前块
    - visual模式下 ?  块注释/反注释当前块
