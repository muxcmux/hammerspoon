local ANIM_SPEED = 0.1

local state = {}

local grid = {
  left = {
    x          = function(screen, width) return screen.x end,
    one_half   = function(screen) return math.floor(screen.w * 1/2) end,
    one_third  = function(screen) return math.floor(screen.w * 1/3) end,
    two_thirds = function(screen) return math.ceil(screen.w * 2/3) end,
    next_size  = { one_third = "one_half", one_half = "two_thirds", two_thirds = "one_third" },
  },
  right = {
    x          = function(screen, width) return screen.w - width end,
    one_half   = function(screen) return math.floor(screen.w * 1/2) end,
    two_thirds = function(screen) return math.ceil(screen.w * 2/3) end,
    one_third  = function(screen) return math.floor(screen.w * 1/3) end,
    next_size  = { one_third = "two_thirds", one_half = "one_third", two_thirds = "one_half" },
  },
  center = {
    x          = function(screen, width) return (screen.w - width) / 2 end,
    one_half   = function(screen) return math.floor(screen.w * 1/2) end,
    one_third  = function(screen) return math.ceil(screen.w * 1/3) end,
    two_thirds = function(screen) return math.ceil(screen.w * 2/3) end,
    next_size  = { one_third = "one_half", one_half = "two_thirds", two_thirds = "one_third" },
  },
}

local function move(position)
  local win = hs.window.focusedWindow()
  local screen = win:screen():frame()
  local id = win:id()
  local s = state[id]
  local size = "one_third"

  if s then
    size = s.position ~= position and s.size or grid[position].next_size[s.size]
  end

  local width = grid[position][size](screen)
  local x = grid[position].x(screen, width)

  win:move({ x = x, y = screen.y, h = screen.h, w = width, }, nil, true, ANIM_SPEED)

  state[id] = { size = size, position = position }
end

local function toggle_fullscreen()
  local win = hs.window.focusedWindow()
  local screen = win:screen():frame()

  win:move({
    x = screen.x,
    y = screen.y,
    w = screen.w,
    h = screen.h,
  }, nil, true, ANIM_SPEED)
end

hs.hotkey.bind({"ctrl", "alt"}, "S", function() move("left") end)
hs.hotkey.bind({"ctrl", "alt"}, "F", function() move("right") end)
hs.hotkey.bind({"ctrl", "alt"}, "D", function() move("center") end)
hs.hotkey.bind({"ctrl", "alt"}, "G", toggle_fullscreen)
