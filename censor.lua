local bleep = hs.sound.getByFile("/Users/muxcmux/.hammerspoon/bleep.mp3")
bleep:volume(0.1)

local function censor_start()
  local mic = hs.audiodevice.findDeviceByName("Q9-1")
  mic:setInputMuted(true)
  bleep:device("BlackHole2ch_UID")
  bleep:play()
end

local function censor_end()
  local mic = hs.audiodevice.findDeviceByName("Q9-1")
  bleep:device("BlackHole2ch_UID")
  bleep:stop()
  mic:setInputMuted(false)
end

hs.hotkey.bind({"ctrl", "shift", "alt"}, "escape", censor_start, censor_end)
