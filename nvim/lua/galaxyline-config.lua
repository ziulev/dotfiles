local cmd = vim.cmd
local fn = vim.fn
local gl = require("galaxyline")
local section = gl.section
local condition = require('galaxyline.condition')
gl.short_line_list = {"LuaTree", "packager", "Floaterm", "coc-eplorer", "NVIMTREE"}

local colors = {
  bg = "NONE",
  -- bg = "#2E3440",
  fg = "#81A1C1",
  line_bg = "NONE",
  -- line_bg = "#2E3440",
  fg_green = "#8FBCBB",
  yellow = "#EBCB8B",
  cyan = "#A3BE8C",
  darkblue = "#81A1C1",
  green = "#8FBCBB",
  orange = "#D08770",
  purple = "#B48EAD",
  magenta = "#BF616A",
  gray = "#616E88",
  blue = "#5E81AC",
  red = "#BF616A"
}

local buffer_not_empty = function()
  if fn.empty(fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end

section.left[1] = {
  GitIcon = {
    provider = function()
      return ' '
    end,
    condition = condition.check_git_workspace,
    separator = '',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.orange, colors.bg}
  }
}

section.left[2] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = '',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}

section.left[3] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green, colors.bg}
  }
}

section.left[4] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.blue, colors.bg}
  }
}

section.left[5] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red, colors.bg}
  }
}


section.right[1] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.error_red, colors.bg}
  }
}

section.right[2] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange, colors.bg}
  }
}

section.right[3] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.blue, colors.bg}
  }
}

section.right[4] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue, colors.bg}
  }
}

section.right[8] = {
  Tabstop = {
    provider = function()
      return "Spaces: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
    end,
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}

section.right[11] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function()
      local tbl = {['dashboard'] = true, [' '] = true}
      if tbl[vim.bo.filetype] then return false end
      return true
    end,
    icon = '    ',
    highlight = {colors.grey, colors.bg}
  }
}

section.right[12] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}


section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE', colors.bg},
    highlight = {colors.grey, colors.bg}
  }
}

section.short_line_left[2] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.grey, colors.bg}
  }
}

section.short_line_right[1] = {
  BufferIcon = {provider = 'BufferIcon', highlight = {colors.grey, colors.bg}}
}

-- section.left[2] = {
--   ViMode = {
--     provider = function()
--       -- auto change color according the vim mode
--       local mode_color = {
--         n = colors.green,
--         i = colors.yellow,
-- 
--         v = colors.blue,
--         [""] = colors.blue,
--         V = colors.blue,
--         c = colors.green,
--         no = colors.yellow,
--         s = colors.orange,
--         S = colors.orange,
--         [""] = colors.orange,
--         ic = colors.yellow,
--         R = colors.purple,
--         Rv = colors.purple,
--         cv = colors.green,
--         ce = colors.green,
--         r = colors.cyan,
--         rm = colors.cyan,
--         ["r?"] = colors.cyan,
--         ["!"] = colors.green,
--         t = colors.green
--       }
--       cmd("hi GalaxyViMode guifg=" .. mode_color[fn.mode()])
--       return "    "
--       -- return "   "
--     end,
--     highlight = {colors.green, colors.line_bg, "bold"}
--   }
-- }
-- section.right[0] = {
--   FileIcon = {
--     provider = "FileIcon",
--     condition = buffer_not_empty,
--     highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
--   }
-- }
-- section.right[1] = {
--   FileName = {
--     -- provider = "FileName",
--     provider = function()
--       return fn.expand("%:F")
--     end,
--     condition = buffer_not_empty,
--     separator = " ",
--     separator_highlight = {colors.white, colors.bg},
--     highlight = {colors.white, colors.line_bg }
--   }
-- }
-- 
-- local checkwidth = function()
--   local squeeze_width = fn.winwidth(0) / 2
--   if squeeze_width > 40 then
--     return true
--   end
--   return false
-- end
-- 
-- section.right[3] = {
--   DiffAdd = {
--     provider = "DiffAdd",
--     condition = checkwidth,
--     icon = "   ",
--     highlight = {colors.green, colors.line_bg}
--   }
-- }
-- section.right[4] = {
--   DiffModified = {
--     provider = "DiffModified",
--     condition = checkwidth,
--     icon = "柳",
--     highlight = {colors.yellow, colors.line_bg}
--   }
-- }
-- section.right[5] = {
--   DiffRemove = {
--     provider = "DiffRemove",
--     condition = checkwidth,
--     icon = " ",
--     highlight = {colors.red, colors.line_bg}
--   }
-- }
-- 
-- section.right[6] = {
--   GitIcon = {
--     provider = function()
--       return "   "
--     end,
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     highlight = {colors.orange, colors.line_bg}
--   }
-- }
-- section.right[7] = {
--   GitBranch = {
--     provider = "GitBranch",
--     condition = require("galaxyline.provider_vcs").check_git_workspace,
--     separator = "",
--     separator_highlight = {colors.purple, colors.bg},
--     highlight = {colors.orange, colors.line_bg}
--   }
-- }
-- 
-- section.right[8] = {
--   LineInfo = {
--     provider = "LineColumn",
--     separator = "",
--     separator_highlight = {colors.blue, colors.line_bg},
--     highlight = {colors.gray, colors.line_bg}
--   }
-- }
-- section.right[7] = {
--   FileSize = {
--     provider = "FileSize",
--     separator = " ",
--     condition = buffer_not_empty,
--     separator_highlight = {one_dark_colors.blue, one_dark_colors.line_bg},
--     highlight = {one_dark_colors.fg, one_dark_colors.line_bg}
--   }
-- }

-- section.right[9] = {
--   DiagnosticError = {
--     provider = "DiagnosticError",
--     separator = " ",
--     icon = " ",
--     highlight = {colors.red, colors.line_bg},
--     separator_highlight = {colors.bg, colors.bg}
--   }
-- }
-- section.right[10] = {
--   DiagnosticWarn = {
--     provider = "DiagnosticWarn",
--     -- separator = " ",
--     icon = " ",
--     highlight = {colors.yellow, colors.line_bg},
--     separator_highlight = {colors.bg, colors.bg}
--   }
-- }
-- 
-- section.right[11] = {
--   DiagnosticInfo = {
--     -- separator = " ",
--     provider = "DiagnosticInfo",
--     icon = " ",
--     highlight = {colors.green, colors.line_bg},
--     separator_highlight = {colors.bg, colors.bg}
--   }
-- }
-- 
-- section.right[12] = {
--   DiagnosticHint = {
--     provider = "DiagnosticHint",
--     -- separator = " ",
--     icon = " ",
--     highlight = {colors.blue, colors.line_bg},
--     separator_highlight = {colors.bg, colors.bg}
--   }
-- }
-- 
-- section.short_line_left[1] = {
--   BufferType = {
--     provider = "FileTypeName",
--     separator = " ",
--     separator_highlight = {"NONE", colors.bg},
--     highlight = {colors.blue, colors.bg, "bold"}
--   }
-- }
-- 
-- section.short_line_left[2] = {
--   SFileName = {
--     provider = function()
--       local fileinfo = require("galaxyline.provider_fileinfo")
--       local fname = fileinfo.get_current_file_name()
--       for _, v in ipairs(gl.short_line_list) do
--         if v == vim.bo.filetype then
--           return ""
--         end
--       end
--       return fname
--     end,
--     condition = buffer_not_empty,
--     highlight = {colors.white, colors.bg, "bold"}
--   }
-- }
-- 
-- section.short_line_right[1] = {
--   BufferIcon = {
--     provider = "BufferIcon",
--     highlight = {colors.fg, colors.bg}
--   }
-- }
