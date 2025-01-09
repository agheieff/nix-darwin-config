local constants = require("constants")

local btc = sbar.add("item", constants.items.BTC, {
  position = "right",
  update_freq = 60,  -- Update every minute
  icon = {
    string = "󰠓",  -- Bitcoin symbol
    padding_left = 8,
    padding_right = 4
  }
})

btc:subscribe({ "forced", "routine" }, function(env)
  local handle = io.popen("curl -s 'https://api.coindesk.com/v1/bpi/currentprice.json' | jq -r '.bpi.USD.rate_float' | xargs printf '%.0f'")
  local price = handle:read("*a")
  handle:close()
  
  btc:set({
    label = price
  })
end)
