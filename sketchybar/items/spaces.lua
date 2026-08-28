local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}
local space_brackets = {}

for i = 1, 10, 1 do
  local space = sbar.add("item", "space." .. i, {
    icon = {
      font = { family = settings.font.numbers },
      string = i,
      padding_left = 8,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 10,
      color = colors.grey,
      highlight_color = colors.white,
      font = "sketchybar-app-font:Regular:16.0",
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = colors.black,
    },
  })

  spaces[i] = space

  -- Single item bracket for space items to achieve double border on highlight
  local space_bracket = sbar.add("bracket", { space.name }, {
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      height = 28,
      border_width = 2
    }
  })
  space_brackets[i] = space_bracket

  -- Padding space
  sbar.add("item", "space.padding." .. i, {
    script = "",
    width = settings.group_paddings,
  })

  space:subscribe("mouse.clicked", function(env)
    sbar.exec("aerospace workspace " .. i)
  end)
end

-- AeroSpace doesn't create real macOS Spaces, so the native "space" item type
-- (which queries Mission Control) can't see individual workspaces. Instead we
-- highlight the focused workspace ourselves, driven by the aerospace_workspace_change
-- trigger that aerospace.toml already sends on every workspace switch.
local function highlight_workspace(focused)
  focused = tonumber(focused)
  for i, space in ipairs(spaces) do
    local selected = (i == focused)
    space:set({
      icon = { highlight = selected },
      label = { highlight = selected },
      background = { border_color = selected and colors.black or colors.bg2 }
    })
    space_brackets[i]:set({
      background = { border_color = selected and colors.grey or colors.bg2 }
    })
  end
end

-- Real per-workspace app icons via AeroSpace CLI (the native space_windows_change
-- event can't tell workspaces apart, see comment above).
local function refresh_workspace_apps()
  for i = 1, 10 do
    sbar.exec("aerospace list-windows --workspace " .. i .. " --format '%{app-name}'", function(output)
      local icon_line = ""
      local no_app = true
      for app in output:gmatch("[^\r\n]+") do
        no_app = false
        local lookup = app_icons[app]
        local icon = (lookup == nil) and app_icons["Default"] or lookup
        icon_line = icon_line .. icon
      end
      if no_app then
        icon_line = "—"
      end
      spaces[i]:set({ label = icon_line })
    end)
  end
end

local aerospace_watcher = sbar.add("item", {
  drawing = false,
  updates = true,
})

aerospace_watcher:subscribe("aerospace_workspace_change", function(env)
  highlight_workspace(env.AEROSPACE_FOCUSED_WORKSPACE)
  refresh_workspace_apps()
end)

aerospace_watcher:subscribe("forced", function(_)
  sbar.exec("aerospace list-workspaces --focused", highlight_workspace)
  refresh_workspace_apps()
end)

local spaces_indicator = sbar.add("item", {
  padding_left = -3,
  padding_right = 0,
  icon = {
    padding_left = 8,
    padding_right = 9,
    color = colors.grey,
    string = icons.switch.on,
  },
  label = {
    width = 0,
    padding_left = 0,
    padding_right = 8,
    string = "Spaces",
    color = colors.bg1,
  },
  background = {
    color = colors.with_alpha(colors.grey, 0.0),
    border_color = colors.with_alpha(colors.bg1, 0.0),
  }
})

spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
  local currently_on = spaces_indicator:query().icon.value == icons.switch.on
  spaces_indicator:set({
    icon = currently_on and icons.switch.off or icons.switch.on
  })
end)

spaces_indicator:subscribe("mouse.entered", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 1.0 },
        border_color = { alpha = 1.0 },
      },
      icon = { color = colors.bg1 },
      label = { width = "dynamic" }
    })
  end)
end)

spaces_indicator:subscribe("mouse.exited", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 0.0 },
        border_color = { alpha = 0.0 },
      },
      icon = { color = colors.grey },
      label = { width = 0, }
    })
  end)
end)

spaces_indicator:subscribe("mouse.clicked", function(env)
  sbar.trigger("swap_menus_and_spaces")
end)
