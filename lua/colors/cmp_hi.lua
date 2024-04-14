local M = {}

local function set_highlight(group, attributes)
  local cmd = string.format("hi %s %s", group, attributes)
  vim.cmd(cmd)
end

function M.cmp_color_setup()
  set_highlight("Pmenu", "guifg=#C5CDD9 guibg=#22252A")
  set_highlight("PmenuSel", "guibg=#9FBD73")
  set_highlight("CmpItemAbbr", "guifg=#C5CDD9 guibg=None")
  set_highlight("CmpItemAbbrDeprecated", "guifg=#7E8294 guibg=NONE gui=strikethrough")
  set_highlight("CmpItemAbbrMatch", "guifg=#82AAFF guibg=NONE gui=bold")
  set_highlight("CmpItemAbbrMatchFuzzy", "guifg=#82AAFF guibg=NONE gui=bold")
  set_highlight("CmpItemMenu", "guifg=#C792EA guibg=NONE gui=italic")
  set_highlight("CmpItemKindField", "guifg=#EED8DA guibg=#B5585F")
  set_highlight("CmpItemKindProperty", "guifg=#EED8DA guibg=#B5585F")
  set_highlight("CmpItemKindEvent", "guifg=#EED8DA guibg=#B5585F")
  set_highlight("CmpItemKindText", "guifg=#C3E88D guibg=#9FBD73")
  set_highlight("CmpItemKindEnum", "guifg=#C3E88D guibg=#9FBD73")
  set_highlight("CmpItemKindKeyword", "guifg=#C3E88D guibg=#9FBD73")
  set_highlight("CmpItemKindConstant", "guifg=#FFE082 guibg=#D4BB6C")
  set_highlight("CmpItemKindConstructor", "guifg=#FFE082 guibg=#D4BB6C")
  set_highlight("CmpItemKindReguiference", "guifg=#FFE082 guibg=#D4BB6C")
  set_highlight("CmpItemKindFunction", "guifg=#EADFF0 guibg=#A377BF")
  set_highlight("CmpItemKindStruct", "guifg=#EADFF0 guibg=#A377BF")
  set_highlight("CmpItemKindClass", "guifg=#EADFF0 guibg=#A377BF")
  set_highlight("CmpItemKindModule", "guifg=#EADFF0 guibg=#A377BF")
  set_highlight("CmpItemKindOperator", "guifg=#EADFF0 guibg=#A377BF")
  set_highlight("CmpItemKindVariable", "guifg=#C5CDD9 guibg=#7E8294")
  set_highlight("CmpItemKindFile", "guifg=#C5CDD9 guibg=#7E8294")
  set_highlight("CmpItemKindUnit", "guifg=#F5EBD9 guibg=#D4A959")
  set_highlight("CmpItemKindSnippet", "guifg=#F5EBD9 guibg=#D4A959")
  set_highlight("CmpItemKindFolder", "guifg=#F5EBD9 guibg=#D4A959")
  set_highlight("CmpItemKindMethod", "guifg=#DDE5F5 guibg=#6C8ED4")
  set_highlight("CmpItemKindValue", "guifg=#DDE5F5 guibg=#6C8ED4")
  set_highlight("CmpItemKindEnumMember", "guifg=#DDE5F5 guibg=#6C8ED4")
  set_highlight("CmpItemKindInterguiface", "guifg=#D8EEEB guibg=#58B5A8")
  set_highlight("CmpItemKindColor", "guifg=#D8EEEB guibg=#58B5A8")
  set_highlight("CmpItemKindTypeParameter", "guifg=#D8EEEB guibg=#58B5A8")
end


return M
