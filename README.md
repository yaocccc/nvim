![nvimyes](https://readme-typing-svg.demolab.com?font=Fira+Code&size=30&pause=1000&color=000000&vCenter=true&width=435&height=45&lines=NVIM+YES)

---

<!-- markdown-toc GitLab -->

* [如何使用](#如何使用)
* [配置结构](#配置结构)
* [lua/options.lua 通用基础配置说明](#luaoptionslua-通用基础配置说明)
* [lua/keymap.lua 快捷键相关配置说明](#luakeymaplua-快捷键相关配置说明)
* [lua/lspinit.lua LSP 配置说明](#lualspinitlua-lsp-配置说明)
* [lua/plugins/ 插件相关的配置说明](#luaplugins-插件相关的配置说明)
* [插件说明以及键位绑定](#插件说明以及键位绑定)
* [Support: buy me a coffee](#support-buy-me-a-coffee)

<!-- markdown-toc -->

## 如何使用

1. 将项目clone至 ~/.config/nvim 目录中(注意备份好自己的配置)  
    ```plaintext
    cd ~/.config
    git clone https://github.com/yaocccc/nvim
    ```
2. 启动vim 等待自动安装lazy.nvim(包管理工具、如果你没有安装的话) 会自动安装所有插件

3. 打开对应语言的文件时，会通过 mason 自动安装对应的 LSP Server

4. 每次修改过lua/plugins/ 中的插件配置后，请运行 :Lazy sync 同步插件

## 配置结构

```dir
.
├─ lua/                -- LUA配置目录
│  ├─ plugins/         -- lazy.nvim 插件配置目录
│  ├─ options.lua      -- 基础配置(各种set、autocmd)
│  ├─ keymap.lua       -- 快捷键配置
│  ├─ lazyinit.lua     -- lazy.nvim 初始化
│  └─ lspinit.lua      -- LSP 初始化(按文件类型自动启用LSP)
├─ lsp/                -- 各语言LSP Server配置
├─ ftplugin/           -- 按文件类型的特殊配置
├─ colors/             -- 样式相关(theme)
├─ snippets/           -- 代码片段
├─ init.lua            -- 配置入口
├─ word.txt            -- 补全用词库
└─ README.md           -- README
```

## lua/options.lua 通用基础配置说明

  不额外说明了，有需要直接看 lua/options.lua 的注释

## lua/keymap.lua 快捷键相关配置说明

| 模式   | 键                   | 说明                              |
| ------ | --------             | ---------                         |
| normal | ;                    | :                                 |
| normal | +                    | 数字自增                          |
| normal | _                    | 数字自减                          |
| normal | ,                    | 重复上一次宏操作(@q)              |
| normal | ctrl + j             | 从, 处打断当前行                  |
| normal | \                    | 清除当前搜索词高亮                |
| normal | \w                   | 开启/关闭wrap显示                 |
| normal | backspace            | 删除当前词并插入                  |
| insert | ctrl + h(backspace)  | 删除内容置词首                    |
| command| ctrl + a             | Home                              |
| command| ctrl + e             | End                               |
| all    | ctrl + s             | 进入替换模式                      |
| normal | S                    | save (智能保存: 自动创建目录/sudo)|
| normal | W                    | 关闭当前buffer                    |
| normal | Q                    | quit                              |
| normal | R                    | 重载当前文件                      |
| visual | > or tab             | 将代码块右移                      |
| visual | < or shift + tab     | 将代码块左移                      |
| all    | shift + 方向         | 选中文本(类似于在其他编辑器的体验)|
| all    | ctrl + shift + 方向  | 快速移动/跳转行首行尾             |
| all    | ctrl + u             | 清空本行                          |
| all    | alt + up/down        | 上下移动当前行/块                 |
| normal | alt + a              | 全选                              |
| normal | sv                   | 左右分屏                          |
| normal | sp                   | 上下分屏                          |
| normal | sc                   | 关闭当前窗口                      |
| normal | so                   | 关闭其他所有窗口                  |
| normal | s + 方向             | 聚焦到对应窗口                    |
| normal | ctrl + space         | 切换窗口                          |
| normal | s=                   | 将窗口大小置为相同                |
| normal | alt + ,              | 窗口减小                          |
| normal | alt + .              | 窗口增大                          |
| normal | ss                   | 切换到下个buffer                  |
| all    | alt + left or right  | 左右跳转buffer                    |
| all    | F5                   | 一键运行当前文件                  |
| normal | -                    | 折叠/反折叠                       |
| visual | -                    | 折叠选中内容                      |
| normal | space                | 在行首 第一个非空字符 行尾 跳转   |
| normal | 0                    | 匹配括号跳转(%)                   |
| visual | t                    | 驼峰和下划线转换(首字母小写)      |
| visual | T                    | 驼峰和下划线转换(首字母大写)      |
| normal | tt                   | 在下方打开终端                    |
| insert | ( [ { " ' `         | 自动配对括号/引号                 |
| normal | x                    | 删除字符(不影响剪切板)            |
| visual | c                    | 修改选中(不影响剪切板)            |
| visual | p/P                  | 粘贴(不影响剪切板)                |

## lua/lspinit.lua LSP 配置说明

使用原生 LSP + mason 自动安装管理 LSP Server。打开对应语言的文件时会自动安装并启用对应的 LSP。

当前支持的语言:

| 语言                          | LSP Server          |
| ------                        | --------            |
| lua                           | lua_ls              |
| solidity                      | solidity_ls         |
| javascript/typescript/react   | vtsls, tailwindcss  |
| vue                           | vue_ls, vtsls, tailwindcss |
| html                          | html, tailwindcss   |
| css/scss/less                 | cssls, tailwindcss  |
| json/jsonc                    | jsonls              |
| go                            | gopls               |
| sh/bash/zsh                   | bashls              |

## lua/plugins/ 插件相关的配置说明

插件配置使用 lazy.nvim 管理，所有插件配置文件位于 `lua/plugins/` 目录下。  
使用 `:Lazy` 命令可以打开插件管理界面，使用 `:Lazy sync` 同步插件。

## 插件说明以及键位绑定


<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">dstein64/vim-startuptime -- 启动时间分析</summary>
  
  [github: dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime)  

  :StartupTime

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">saghen/blink.cmp -- 自动补全</summary>

  [github: saghen/blink.cmp](https://github.com/saghen/blink.cmp)  

  补全源: lsp, path, snippets, buffer, ripgrep, datword(自定义词库)

  | 模式    | 键                   | 说明                                 |
  | ------  | --------             | ---------                            |
  | insert  | Tab                  | 选择下一个/触发补全                  |
  | insert  | Up/Down              | 上/下选择                            |
  | insert  | CR                   | 确认选择                             |
  | insert  | ctrl + y             | 选中并确认                           |
  | insert  | ctrl + e             | 取消补全                             |
  | insert  | ctrl + k             | 显示补全/文档                        |
  | cmdline | Tab                  | 触发补全/选择下一个                  |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">nvimdev/lspsaga.nvim -- LSP 增强UI</summary>

  [github: nvimdev/lspsaga.nvim](https://github.com/nvimdev/lspsaga.nvim)  

  | 模式   | 键                   | 说明                              |
  | ------ | --------             | ---------                         |
  | normal | gd                   | 跳转到定义                        |
  | normal | gD                   | 跳转到声明                        |
  | normal | gy                   | 跳转到类型定义                    |
  | normal | gi                   | 跳转到实现                        |
  | normal | gr                   | 查找引用(Finder)                  |
  | normal | K                    | 查看悬浮文档                      |
  | all    | ga                   | 代码操作(Code Action)             |
  | normal | F2                   | 重命名                            |
  | normal | ctrl + e             | 查看当前buffer诊断列表            |
  | normal | \e                   | 查看workspace诊断列表             |
  | visual | =                    | 格式化选中内容                    |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">mason-org/mason.nvim -- LSP Server 管理</summary>

  [github: mason-org/mason.nvim](https://github.com/mason-org/mason.nvim)  

  :Mason 打开管理界面，LSP Server 会在打开对应文件时自动安装

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">lewis6991/gitsigns.nvim -- Git 集成</summary>

  [github: lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)  

  | 模式   | 键                   | 说明                              |
  | ------ | --------             | ---------                         |
  | normal | (                    | 上一处修改                        |
  | normal | )                    | 下一处修改                        |
  | normal | C                    | 预览当前hunk                      |
  | normal | \g                   | diff当前文件                      |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">terryma/vim-expand-region -- 快速选中文本</summary>
  
  [github: terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)  

  | 模式   | 键                   | 说明                              |
  | ------ | --------             | ---------                         |
  | visual | v                    | 扩大选中范围                      |
  | visual | V                    | 缩小选中范围                      |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">Mr-LLLLL/interestingwords.nvim -- 高亮关键词</summary>
  
  [github: Mr-LLLLL/interestingwords.nvim](https://github.com/Mr-LLLLL/interestingwords.nvim)  

  | 模式   | 键                   | 说明                              |
  | ------ | --------             | ---------                         |
  | normal | ff                   | 高亮/取消高亮 当前词              |
  | normal | FF                   | 取消高亮 全部词                   |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">mg979/vim-visual-multi -- 虚拟多光标</summary>
  
  [github: mg979/vim-visual-multi](https://github.com/mg979/vim-visual-multi)  

  建议到对应的仓库仔细看文档  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | ctrl + up/down       | 上下添加虚拟光标(normal模式)         |
  | normal | ctrl + left/right    | 虚拟光标左右扩选(visual模式)         |
  | normal | ctrl + d             | 所有`当前词`添加虚拟光标(visual模式) |
  | normal | ctrl + x             | 当前字符添加虚拟光标(normal模式)     |
  | normal | ctrl + w             | 添加当前词首(normal模式)             |
  | all    | ctrl + n/p           | 添加下/上一个当前词到虚拟光标        |
  | all    | q                    | 移除当前光标位置下的虚拟光标         |
  | normal | tab                  | 切换到visual模式                     |
  | visual | tab                  | 切换到normal模式                     |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">ibhagwan/fzf-lua -- 文本/文件搜索</summary>

  [github: ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)  

  注意要配合rg使用，请自己手动安装: ripgrep fd bat  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | ctrl + a             | 全局文本搜索(live_grep)              |
  | normal | ctrl + p             | 全局文件搜索                         |
  | normal | ctrl + b             | buffer列表搜索                       |
  | normal | ctrl + l             | 当前buffer文本搜索                   |
  | normal | ctrl + g             | git变更文件搜索                      |
  | normal | ctrl + h             | 历史文件搜索                         |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">iamcco/markdown-preview.nvim -- md 预览插件</summary>

  [github: iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | F5                   | 在浏览器预览markdown                 |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">MeanderingProgrammer/render-markdown.nvim -- markdown 渲染增强</summary>

  [github: MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)  

  在nvim中直接渲染markdown，包括代码块高亮等

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | F6                   | 切换是否渲染                         |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">voldikss/vim-floaterm -- 悬浮终端插件</summary>

  [github: voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | ctrl + t             | 打开浮动终端                         |
  | normal | F5                   | 根据文件类型启动浮动终端执行当前文件 |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">kyazdani42/nvim-tree.lua -- 文件管理器(浮动窗口)</summary>

  [github: kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)  

  | 模式        | 键                   | 说明                                 |
  | ------      | --------             | ---------                            |
  | normal      | T                    | 打开/关闭 nvim-tree                  |
  | nvim-tree内 | a/A                  | 新建文件或文件夹                     |
  | nvim-tree内 | r                    | 重命名                               |
  | nvim-tree内 | W                    | 关闭所有打开的目录                   |
  | nvim-tree内 | <left>               | 关闭当前目录                         |
  | nvim-tree内 | <right>/<cr>         | 打开文件/目录                        |
  | nvim-tree内 | <bs>                 | 回退到上级目录                       |
  | nvim-tree内 | P                    | cd到选中目录                         |
  | nvim-tree内 | H                    | 显示/隐藏 .文件                      |
  | nvim-tree内 | I                    | 显示/隐藏 忽略文件(gitignore等)      |
  | nvim-tree内 | d                    | 删除文件/文件夹                      |
  | nvim-tree内 | x                    | 剪切文件/文件夹到剪切板              |
  | nvim-tree内 | c                    | 复制文件/文件夹到剪切板              |
  | nvim-tree内 | p                    | 从剪切板粘贴                         |
  | nvim-tree内 | y                    | 复制文件名                           |
  | nvim-tree内 | ?                    | 查看帮助                             |
  | nvim-tree内 | <esc>                | 关闭nvim-tree                        |
  | nvim-tree内 | (/)                  | 上/下一个git变更                     |
  | nvim-tree内 | </>                  | 上/下一个诊断                        |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">nvim-treesitter/nvim-treesitter -- 文本分析插件</summary>

  [github: nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  
  打开对应语言文件时自动安装对应的 treesitter parser

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">nvimdev/indentmini.nvim -- 缩进线显示</summary>

  [github: nvimdev/indentmini.nvim](https://github.com/nvimdev/indentmini.nvim)  

  显示缩进参考线，高亮当前缩进层级

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">zbirenbaum/copilot.lua -- Github Copilot</summary>

  [github: zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | insert | right                | 接受建议                             |
  | insert | ctrl + up/down       | 上/下个建议                          |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">acidsugarx/babel.nvim -- 翻译插件</summary>

  [github: acidsugarx/babel.nvim](https://github.com/acidsugarx/babel.nvim)  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | mm                   | 翻译当前词                           |
  | visual | mm                   | 翻译选中文文本                       |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">uga-rosa/ccc.nvim -- 颜色选择器</summary>

  [github: uga-rosa/ccc.nvim](https://github.com/uga-rosa/ccc.nvim)  

  :CccPick 打开颜色选择器  
  :CccHighlighterEnable 开启颜色高亮显示

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/nvim-lines.lua -- 状态栏/标签栏</summary>

  [github: yaocccc/nvim-lines.lua](https://github.com/yaocccc/nvim-lines.lua)  

  没啥好说明的 用就完了

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/nvim-foldsign -- 在signcolumn显示折叠信息</summary>

  [github: yaocccc/nvim-foldsign](https://github.com/yaocccc/nvim-foldsign)  

  在signcolumn显示折叠信息 如果你使用折叠的话

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/vim-surround -- 快速操作({["'`等的</summary>

  [github: yaocccc/vim-surround](https://github.com/yaocccc/vim-surround)  

  选中文本后 再使用 " ' { ( 等 可以将文本包裹起来  
  ds": 删除包裹的"" 其他的相同  
  ys": 用""将当前词包裹起来  
  cs"{: 用{}替换掉""  

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/vim-comment -- 快速注释</summary>

  [github: yaocccc/vim-comment](https://github.com/yaocccc/vim-comment)  

  普通模式 ??: 行注释当前行
  选中文本后 /: 行注释选中内容
  选中文本后 ?: 块注释选中内容

  **以上操作 可以用相同的操作逆转 (??行注释 ??取消行注释)**

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/vim-fcitx2en -- 退出insert模式时 自动切换到英文</summary>

  [github: yaocccc/vim-fcitx2en](https://github.com/yaocccc/vim-fcitx2en)  

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/vim-echo -- 根据文件名或文件类型快速echo、print、console.log</summary>

  [github: yaocccc/vim-echo](https://github.com/yaocccc/vim-echo)  

  选中文本后 C: 再下一行添加 console.log(选中的内容) 或 echo $选中的内容 等等等

</details>

## Support: buy me a coffee

<a href="#TOP" target="_blank">
  <img src="https://github.com/yaocccc/yaocccc/raw/master/qr.png">
</a>
