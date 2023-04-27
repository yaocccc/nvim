![nvimyes](https://readme-typing-svg.demolab.com?font=Fira+Code&size=30&pause=1000&color=000000&vCenter=true&width=435&height=45&lines=NVIM+YES)

---

<!-- markdown-toc GitLab -->

* [如何使用](#如何使用)
* [配置结构](#配置结构)
* [lua/profile.lua 通用基础配置说明](#luaprofilelua-通用基础配置说明)
* [lua/keymap.lua 快捷键相关配置说明](#luakeymaplua-快捷键相关配置说明)
* [lua/packinit.lua 插件相关的配置说明](#luapackinitlua-插件相关的配置说明)
* [插件说明以及键位绑定](#插件说明以及键位绑定)
* [Support: buy me a coffee](#support-buy-me-a-coffee)

<!-- markdown-toc -->

## 如何使用

1. 将项目clone至 ~/.config/nvim 目录中(注意备份好自己的配置)  
    ```plaintext
    cd ~/.config
    git clone https://github.com/yaocccc/nvim
    ```
2. 启动vim 等待自动安装packer(包管理工具、如果你没有安装的话) 会自动安装所有插件

3. 每次修改过lua/packinit.lua 请重启后PackerSync

## 配置结构

```dir
.
├─ lua/                -- LUA配置目录
│  ├─ pack/            -- 各插件的配置目录
│  ├─ G.lua            -- G: Global 封装了lua配置内用到的部分通用方法
│  ├─ profile.lua      -- 环境变量(各种set)
│  ├─ keymap.lua       -- 快捷键配置
│  ├─ packinit.lua     -- 插件配置入口
│  └─ autocmd.lua      -- 自动命令
├─ colors/             -- 样式相关(theme)
├─ snippets/           -- 代码片段
├─ init.lua            -- 配置入口
├─ coc-settings.json   -- coc配置
└─ README.md           -- README
```

## lua/profile.lua 通用基础配置说明

  不额外说明了，有需要直接看 lua/profile.lua 的注释

## lua/keymap.lua 快捷键相关配置说明

| 模式   | 键                   | 说明                              |
| ------ | --------             | ---------                         |
| normal | ;                    | :                                 |
| normal | +                    | 数字自增                          |
| normal | _                    | 数字自减                          |
| normal | ,                    | 重复上一次宏操作                  |
| normal | ctrl + j             | 从, 处打断当前行                  |
| normal | \                    | 清除当前搜索词高亮                |
| normal | \w                   | 开启/关闭wrap显示                 |
| normal | backspace            | 删除当前词并插入                  |
| insert | ctrl + h(backspace)  | 删除内容置词首                    |
| insert | ctrl + z             | 撤销最后修改并退出编辑            |
| command| ctrl + a             | Home                              |
| command| ctrl + e             | End                               |
| all    | ctrl + s             | 进入替换模式                      |
| normal | S                    | save                              |
| normal | W                    | close                             |
| normal | Q                    | quit                              |
| normal | R                    | 重载配置                          |
| normal | >>                   | 将代码块右移                      |
| normal | <<                   | 将代码块左移                      |
| visual | > or tab             | 将代码块右移                      |
| visual | < or shift + tab     | 将代码块左移                      |
| all    | shift + 方向         | 选中文本(类似于在其他编辑器的体验)|
| all    | ctrl + shift + 方向  | 快速移动                          |
| all    | ctrl + u             | 清空本行                          |
| all    | alt + up/down        | 上下移动当前行/块                 |
| all    | alt + o              | 下方新起一行                      |
| all    | alt + O              | 上方新起一行                      |
| normal | sv                   | 左右分屏                          |
| normal | sp                   | 上下分屏                          |
| normal | sc                   | 关闭当前窗口                      |
| normal | so                   | 关闭其他所有窗口                  |
| normal | s + 方向             | 聚焦到对应窗口                    |
| normal | ctrl + space         | 切换窗口                          |
| normal | s=                   | 将窗口大小置为相同                |
| normal | s,                   | 窗口减小                          |
| normal | s.                   | 窗口增大                          |
| normal | ss                   | 切换到下个buffer                  |
| all    | alt + left or right  | 左右跳转buffer                    |
| all    | F5                   | 一键运行当前文件                  |
| normal | --                   | 折叠/反折叠                       |
| visual | -                    | 折叠选中内容                      |
| normal | space                | 在行首 第一个非空字符 行尾 跳转   |
| visual | =                    | 格式化选中内容                    |
| visual | t                    | 驼峰和下划线转换                  |

PS: 如果需要格式化js和ts代码，请手动安装: npm i js-beautify -g

## lua/packinit.lua 插件相关的配置说明

## 插件说明以及键位绑定


<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">dstein64/vim-startuptime -- 启动时间分析</summary>
  
  [github: dstein64/vim-startuptime](https://github.com/dstein64/vim-startuptime)  

  :StartupTime

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
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">lfv89/vim-interestingwords -- 高亮关键词</summary>
  
  [github: lfv89/vim-interestingwords](https://github.com/lfv89/vim-interestingwords)  

  | 模式   | 键                   | 说明                              |
  | ------ | --------             | ---------                         |
  | normal | ff                   | 高亮/取消高亮 当前词              |
  | normal | FF                   | 取消高亮 全部词                   |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">mg979/vim-visual-multi -- 虚拟多光标</summary>
  
  [gihub: **mg979/vim-visual-multi**](https://github.com/mg979/vim-visual-multi)  
  [bilibili视频介绍: BV1uF411c7Ro](https://www.bilibili.com/video/BV1uF411c7Ro)  

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
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">iamcco/markdown-preview.nvim -- md 预览插件</summary>

  [github: iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)  

  guide: 如果无法使用 请  
  1. 修改 lua/pack/markdown.lua 中的 G.g.mkdp_browser 去掉或者修改成自己使用的浏览器
  2. cd ~/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim/app && yarn

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | F5                   | 在浏览器预览markdown                 |
 
</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">mzlogin/vim-markdown-toc -- md 生成目录</summary>

  [github: mzlogin/vim-markdown-toc](https://github.com/mzlogin/vim-markdown-toc)
  
  :GenTocGFM 在markdown文件头部生成TOC

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">voldikss/vim-floaterm -- 悬浮终端插件</summary>

  [github: voldikss/vim-floaterm](https://github.com/voldikss/vim-floaterm)

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | ctrl + t             | 打开浮动终端                         |
  | normal | ctrl + b             | 打开数据库可视化工具(dadbod)         |
  | normal | F5                   | 根据文件类型启动浮动终端执行当前文件 |
  
</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">tpope/vim-dadbod -- 数据库可视化工具</summary>

  [github: tpope/vim-dadbod](https://github.com/tpope/vim-dadbod)  
  [github: kristijanhusak/vim-dadbod-ui](kristijanhusak/vim-dadbod-ui)  

  :DBUI 来使用 数据库可视化工具  
  添加链接: let g:dbs = [{ 'name': 'connection_name', 'url': 'mysql://user:password@host:port' }]  
  注意 url内的东西需要url_encode  

  也可直接 :CALLDB 呼出界面按界面引导 添加链接 链接格式同上
  
</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">junegunn/fzf.vim -- 文本/文件搜索</summary>

  [github: **junegunn/fzf.vim**](https://github.com/junegunn/fzf.vim)  

  注意要配合rg使用，请自己手动安装: ripgrep fd bat  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | normal | ctrl + a             | Rg搜索(全局文本搜索)                 |
  | normal | ctrl + l             | 当前buffer文本搜索                   |
  | normal | ctrl + p             | 全局文件搜索                         |
  | normal | ctrl + g             | git变更文件搜索                      |
  | normal | ctrl + h             | 历史文件搜索                         |
  | fzf中  | ctrl + /             | 启动/关闭 预览                       |
  | fzf中  | ctrl + n             | 下一个搜索历史                       |
  | fzf中  | ctrl + p             | 上一个搜索历史                       |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">gelguy/wilder.nvim -- 弹出式的命令行</summary>

  [github: gelguy/wilder.nvim](https://github.com/gelguy/wilder.nvim)  

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">kyazdani42/nvim-tree.lua -- 文件管理器</summary>

  [github: kyazdani42/nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)  

  | 模式        | 键                   | 说明                                 |
  | ------      | --------             | ---------                            |
  | normal      | T                    | 打开/关闭 nvim-tree                  |
  | nvim-tree内 | a/A                  | 新建文件或文件夹                     |
  | nvim-tree内 | r                    | 重命名                               |
  | nvim-tree内 | W                    | 关闭所有打开的目录                   |
  | nvim-tree内 | <left>               | 关闭当前目录                         |
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
  | nvim-tree内 | go                   | 若当前查看的文件为外部文件 cd到目录  |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">nvim-treesitter/nvim-treesitter -- 文本分析插件</summary>

  [github: nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  
  没啥好说明的 用就完了  

  可以用 H 快捷键看高亮组 然后到 lua/pack/tree-sitter.lua 中修改对应的样式  
  R刷新高亮

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">neoclide/coc.nvim -- coc</summary>

  [github: neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)

  **建议到对应的仓库看一下**  
  
  全局的插件列表 lua/pack/coc.lua -- G.g.coc_global_extensions = {...} 按需添加  

  | 模式   | 键                   | 说明                              | 对应的coc插件  |
  | ------ | --------             | ---------                         | ----           |
  | normal | gd                   | 跳转到定义                        | coc            |
  | normal | gy                   | 跳转到类型                        | coc            |
  | normal | gr                   | 跳转到实现                        | coc            |
  | normal | K                    | 查看文档                          | coc            |
  | normal | c-e                  | 查看诊断列表                      | coc            |
  | normal | F2                   | 重命名                            | coc            |
  | normal | F4                   | 关闭/开启coc                      | coc            |
  | normal | c-e                  | 查看诊断列表                      | coc            |
  | normal | mm                   | 翻译当前词                        | coc-translator |
  | normal | F9                   | 编辑当前文件类型的snippet         | coc-snippets   |
  | normal | (                    | 上一处修改                        | coc-git        |
  | normal | )                    | 下一处修改                        | coc-git        |
  | normal | C                    | 显示当前行提交记录                | coc-git        |
  | normal | \g                   | 开启/关闭 git blame 显示          | coc-git        |
  | visual | if                   | 选中func内                        | coc            |
  | visual | af                   | 选中func                          | coc            |
  | visual | ic                   | 选中class内                       | coc            |
  | visual | ac                   | 选中class                         | coc            |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">github/copilot.vim -- github copilot</summary>

  [github: github/copilot.vim](https://github.com/github/copilot.vim)  

  | 模式   | 键                   | 说明                                 |
  | ------ | --------             | ---------                            |
  | insert | right                | 接受建议                             |
  | insert | ctrl + ]             | 取消建议                             |
  | insert | alt + [或]           | 上/下个建议                          |

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/nvim-lines.lua -- 状态栏/标签栏</summary>

  [github: yaocccc/nvim-lines.lua](https://github.com/yaocccc/nvim-lines.lua)  

  没啥好说明的 用就完了

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/nvim-hlchunk -- {}区间高亮</summary>

  [github: yaocccc/nvim-hlchunk](https://github.com/yaocccc/nvim-hlchunk)  

  没啥好说明的 用就完了

</details>

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/nvim-hl-mdcodeblock.lua -- 高亮markdown中的代码块</summary>

  [github: yaocccc/nvim-hl-mdcodeblock.lua](https://github.com/yaocccc/nvim-hl-mdcodeblock.lua)  

  没啥好说明的 用就完了

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

<details>
  <summary style="cursor: pointer; text-decoration:underline; color: #2AD;">yaocccc/nvim-foldsign -- 在signcolumn显示折叠信息</summary>

  [github: yaocccc/nvim-foldsign](https://github.com/yaocccc/nvim-foldsign)  

  在signcolumn显示折叠信息 如果你使用折叠的话

</details>

## Support: buy me a coffee

<a href="#TOP" target="_blank">
  <img src="https://github.com/yaocccc/yaocccc/raw/master/qr.png">
</a>
