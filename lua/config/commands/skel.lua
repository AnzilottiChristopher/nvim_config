vim.api.nvim_create_user_command('Skel', function(opts)
    local ext = vim.fn.expand('%:e')
    local skeletons = {
        c    = '#include <stdio.h>\n\nint main(int argc, char *argv[]) {\n    \n    return 0;\n}\n',
        cpp  = '#include <iostream>\nusing namespace std;\n\nint main() {\n    \n    return 0;\n}\n',
        py   = '#!/usr/bin/env python3\n\ndef main():\n    pass\n\nif __name__ == "__main__":\n    main()\n',
        rs   = 'fn main() {\n    \n}\n',
        go   = 'package main\n\nimport "fmt"\n\nfunc main() {\n    fmt.Println("Hello")\n}\n',
        sh   = '#!/usr/bin/env bash\nset -euo pipefail\n\n',
        lua  = '-- main logic\nlocal M = {}\n\nfunction M.setup()\n    \nend\n\nreturn M\n',
        js   = '"use strict";\n\nfunction main() {\n    \n}\n\nmain();\n',
        ts   = 'function main(): void {\n    \n}\n\nmain();\n',
        html =
        '<!DOCTYPE html>\n<html lang="en">\n<head>\n  <meta charset="UTF-8">\n  <title></title>\n</head>\n<body>\n  \n</body>\n</html>\n',
    }

    local skel = skeletons[ext]
    if not skel then
        print('No skeleton for extension: ' .. (ext ~= '' and ext or '(none)'))
        return
    end

    local is_empty = vim.fn.line('$') == 1 and vim.fn.getline(1) == ''
    if not is_empty and not opts.bang then
        print('Buffer not empty. Use :Skel! to force.')
        return
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(skel, '\n'))
end, { bang = true })
