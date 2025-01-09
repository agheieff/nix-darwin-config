local constants = require("constants")
local settings = require("config.settings")

local wifi = sbar.add("item", constants.items.WIFI, {
  position = "right",
  icon = {
    string = settings.icons.text.wifi.disconnected,
    color = settings.colors.magenta,
  },
  padding_right = 0,
  padding_left = 0,
})

sbar.add("item", { position = "right", width = settings.dimens.padding.item })

wifi:subscribe({ "wifi_change", "system_woke", "forced" }, function(env)
  wifi:set({
    icon = {
      string = settings.icons.text.wifi.disconnected,
      color = settings.colors.magenta,
    }
  })

  sbar.exec([[ipconfig getifaddr en0]], function(ip)
    local ipConnected = not (ip == "")

    local wifiIcon
    local wifiColor

    if ipConnected then
      wifiIcon = settings.icons.text.wifi.connected
      wifiColor = settings.colors.white
    end

    wifi:set({
      icon = {
        string = wifiIcon,
        color = wifiColor,
      }
    })

    sbar.exec([[sleep 2; scutil --nwi | grep -m1 'utun' | awk '{ print $1 }']], function(vpn)
      local isVPNConnected = not (vpn == "")

      if isVPNConnected then
        wifiIcon = settings.icons.text.wifi.vpn
        wifiColor = settings.colors.green
      end

      wifi:set({
        icon = {
          string = wifiIcon,
          color = wifiColor,
        }
      })
    end)
  end)
end)
