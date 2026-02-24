return {
    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
    filetypes = { 'solidity' },
    root_markers = { '.git', 'package.json' },
    settings = { solidity = { includePath = '', remapping = {} } },
}
