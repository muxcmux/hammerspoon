local ANIM_SPEED = 0.1

local function toggle_left()
  local win = hs.window.focusedWindow()
  local window = win:frame()
  local screen = win:screen():frame()

  if window.x + window.w >= screen.w and window.w < screen.w then
    win:move({
      x = screen.x,
      y = window.y,
      w = window.w,
      h = window.h,
    }, nil, true, ANIM_SPEED)
  elseif window.w < math.floor(screen.w * 1/3) or window.w >= math.ceil(screen.w * 2/3) then
    win:move({
      x = screen.x,
      y = screen.y,
      w = math.floor(screen.w * 1/3),
      h = screen.h,
    }, nil, true, ANIM_SPEED)
  elseif window.w < math.floor(screen.w * 1/2) then
    win:move({
      x = screen.x,
      y = screen.y,
      w = math.floor(screen.w * 1/2),
      h = screen.h,
    }, nil, true, ANIM_SPEED)
  else
    win:move({
      x = screen.x,
      y = screen.y,
      w = math.ceil(screen.w * 2/3),
      h = screen.h,
    }, nil, true, ANIM_SPEED)
  end
end

local function toggle_right()
  local win = hs.window.focusedWindow()
  local window = win:frame()
  local screen = win:screen():frame()

  if window.x == screen.x and window.w < screen.w then
    win:move({
      x = screen.w - window.w,
      y = window.y,
      w = window.w,
      h = window.h,
    }, nil, true, ANIM_SPEED)
  elseif window.w > math.ceil(screen.w * 2/3) or window.w <= math.floor(screen.w * 1/3) then
    win:move({
      x = math.floor(screen.w * 1/3),
      y = screen.y,
      w = math.ceil(screen.w * 2/3),
      h = screen.h,
    }, nil, true, ANIM_SPEED)
  elseif window.w > math.floor(screen.w * 1/2) then
    win:move({
      x = math.floor(screen.w * 1/2),
      y = screen.y,
      w = math.floor(screen.w * 1/2),
      h = screen.h,
    }, nil, true, ANIM_SPEED)
  else
    win:move({
      x = math.ceil(screen.w * 2/3),
      y = screen.y,
      w = math.floor(screen.w * 1/3),
      h = screen.h,
    }, nil, true, ANIM_SPEED)
  end
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
