if true then
  return {}
end

-- This whole thing is to move notifications from the far right of the screen, to the far left,
-- via the col_offset value.
local notify = { col_offset = 1 }

function custom_fade_in_slide_out(direction, stages_util)
  return {
    function(state)
      local next_height = state.message.height + 2
      local next_row = stages_util.available_slot(state.open_windows, next_height, direction)
      if not next_row then
        return nil
      end
      return {
        relative = "editor",
        anchor = "NE",
        width = state.message.width,
        height = state.message.height,
        col = notify.col_offset,
        row = next_row,
        border = "rounded",
        style = "minimal",
        opacity = 0,
      }
    end,
    function(state, win)
      return {
        opacity = { 100 },
        col = notify.col_offset,
        row = {
          stages_util.slot_after_previous(win, state.open_windows, direction),
          frequency = 3,
          complete = function()
            return true
          end,
        },
      }
    end,
    function(state, win)
      return {
        col = notify.col_offset,
        time = true,
        row = {
          stages_util.slot_after_previous(win, state.open_windows, direction),
          frequency = 3,
          complete = function()
            return true
          end,
        },
      }
    end,
    function(state, win)
      return {
        width = {
          1,
          frequency = 2.5,
          damping = 0.9,
          complete = function(cur_width)
            return cur_width < 3
          end,
        },
        opacity = {
          0,
          frequency = 2,
          complete = function(cur_opacity)
            return cur_opacity <= 4
          end,
        },
        col = notify.col_offset,
        row = {
          stages_util.slot_after_previous(win, state.open_windows, direction),
          frequency = 3,
          complete = function()
            return true
          end,
        },
      }
    end,
  }
end

return {
  {
    "rcarriga/nvim-notify",
    config = function()
      local stages_util = require("notify.stages.util")
      require("notify").setup({
        background_colour = "NotifyBackground",
        fps = 30,
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 2,
        minimum_width = 50,
        render = "default",
        time_formats = {
          notification = "%T",
          notification_history = "%FT%T",
        },
        top_down = true,
        timeout = 1500,
        stages = custom_fade_in_slide_out(stages_util.DIRECTION.TOP_DOWN, stages_util),
      })
    end,
  },
}
