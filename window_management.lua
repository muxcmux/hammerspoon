local ANIM_SPEED = 0.15

local function move(offset_fraction, size_fraction)
  local win = hs.window.focusedWindow()
  local screen = win:screen():frame()

  win:move({
    x = offset_fraction == 0 and screen.x or screen.w * offset_fraction,
    y = screen.y,
    w = screen.w * size_fraction,
    h = screen.h,
  }, nil, true, ANIM_SPEED)
end

hs.hotkey.bind({"ctrl", "alt"}, "S", function()
  move(0, 1/3)
end)

hs.hotkey.bind({"ctrl", "alt"}, "D", function()
  move(0, 1/2)
end)

hs.hotkey.bind({"ctrl", "alt"}, "X", function()
  move(0, 2/3)
end)

hs.hotkey.bind({"ctrl", "alt"}, "F", function()
  move(1/2, 1/2)
end)

hs.hotkey.bind({"ctrl", "alt"}, "G", function()
  move(2/3, 1/3)
end)

hs.hotkey.bind({"ctrl", "alt"}, "B", function()
  move(1/3, 2/3)
end)

