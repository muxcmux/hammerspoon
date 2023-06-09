local bleep = hs.sound.getByFile("/Users/muxcmux/.hammerspoon/bleep.mp3")

bleep:volume(0.1)

local mic = hs.audiodevice.findDeviceByUID("AppleUSBAudioEngine:CMEDIA:Q9-1:2222000:1")

bleep:device("BlackHole2ch_UID")

local function censor_start()
  mic:setInputMuted(true)
  bleep:play()
end

local function censor_end()
  bleep:stop()
  mic:setInputMuted(false)
end

hs.hotkey.bind({"ctrl", "shift", "alt"}, "escape", censor_start, censor_end)
