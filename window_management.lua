local ANIM_SPEED = 0.1

local function toggle_left()
  local win = hs.window.focusedWindow()
  local window = win:frame()
  local screen = win:screen():frame()

  local width = 2/3

  if window.x + window.w >= screen.w and window.w < screen.w then
    win:move({
      x = screen.x,
      y = window.y,
      w = window.w,
      h = window.h,
    }, nil, true, ANIM_SPEED)
  elseif window.w < math.floor(screen.w * 1/3) or window.w >= math.ceil(screen.w * 2/3) then
    width = 1/3
  elseif window.w < math.floor(screen.w * 1/2) then
    width = 1/2
  end

  win:move({
    x = screen.x,
    y = screen.y,
    w = width == 2/3 and math.ceil(screen.w * width) or math.floor(screen.w * width),
    h = screen.h,
  }, nil, true, ANIM_SPEED)
end

local function toggle_right()
  local win = hs.window.focusedWindow()
  local window = win:frame()
  local screen = win:screen():frame()

  local x = 2/3
  local width = 1/3

  if window.x == screen.x
     and window.w < screen.w then
    win:move({
      x = screen.w - window.w,
      y = window.y,
      w = window.w,
      h = window.h,
    }, nil, true, ANIM_SPEED)
  elseif window.w > math.ceil(screen.w * 2/3) or window.w <= math.floor(screen.w * 1/3) then
    x = 1/3
    width = 2/3
  elseif window.w > math.floor(screen.w * 1/2) then
    x = 1/2
    width = 1/2
  end

  win:move({
    x = x == 2/3 and math.ceil(screen.w * x) or math.floor(screen.w * x),
    y = screen.y,
    w = width == 2/3 and math.ceil(screen.w * width) or math.floor(screen.w * width),
    h = screen.h,
  }, nil, true, ANIM_SPEED)
end

local function toggle_center()
  local win = hs.window.focusedWindow()
  local window = win:frame()
  local screen = win:screen():frame()

  local width = math.ceil(screen.w * 2/3)

  if window.w < math.floor(screen.w * 1/3) or window.w >= math.ceil(screen.w * 2/3) then
    width = math.ceil(screen.w * 1/3)
  elseif window.w < math.floor(screen.w * 1/2) then
    width = math.floor(screen.w * 1/2)
  end

  win:move({
    x = math.floor((screen.w - width) / 2),
    y = screen.y,
    w = width,
    h = screen.h,
  }, nil, true, ANIM_SPEED)
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

hs.hotkey.bind({"ctrl", "alt"}, "S", toggle_left)
hs.hotkey.bind({"ctrl", "alt"}, "F", toggle_right)
hs.hotkey.bind({"ctrl", "alt"}, "D", toggle_center)
hs.hotkey.bind({"ctrl", "alt"}, "G", toggle_fullscreen)
