local colors <const> = {
  black = 0xff181819,
  white = 0xfff8f8f2,
  red = 0xf1cc3e44,
  green = 0xff8aff81,
  blue = 0xff5199ba,
  yellow = 0xffffff81,
  orange = 0xfff4c07b,
  other_purple = 0xff302c45,
  cyan = 0xff7bf2de,
  dirty_white = 0xc8cad3f5,
  bar = 0x00223300,
  popup = {
  },
  slider = {
    bg = 0xf1151320,
    border = 0xff2c2e34,
  },
  bg1 = 0xd322212c,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}

return colors
