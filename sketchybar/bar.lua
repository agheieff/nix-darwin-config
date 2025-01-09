local settings = require("config.settings")

sbar.bar({
	topmost = "on",
	height = settings.dimens.graphics.bar.height,
	color = 0xff102040,
	padding_right = settings.dimens.padding.bar,
	padding_left = settings.dimens.padding.bar,
	margin = 0,
	corner_radius = settings.dimens.graphics.background.corner_radius,
	y_offset = settings.dimens.graphics.bar.offset,
	border_width = 0,
})
