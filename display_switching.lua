-- DisplayPort 1: 15
-- DisplayPort 2: 16
-- HDMI 1: 17
-- HDMI 2: 18
-- USB-C: 27
hs.hotkey.bind({"ctrl", "shift", "alt"}, "F", function()
  hs.execute("/Users/muxcmux/src/thirdparty/m1ddc/m1ddc display 1 set input 15")
end)

-- hs.hotkey.bind({"ctrl", "shift", "alt"}, "G", function()
--   hs.execute("/Users/muxcmux/src/m1ddc/m1ddc display 1 set input 18")
-- end)
