require('hlchunk').setup({
    chunk = {
        enable = true,
        notify = false, 
        chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = "─",
        },
    style = "#00ffff",
    },
    line_num = {
        enable = true;
        notify = false, 
        style = "#806d9c",
    },
    indent = {
        enable = false,
        notify = false, 
    },
    blank = {
        enable = false,
        notify = false, 
    },
})
