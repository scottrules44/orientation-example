local orientation = require "plugin.orientation"
orientation.init()
local bg = display.newRect(display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
bg:setFillColor(.5)


local prefillText = "Orientation Plugin(tap to change lock):"
local orientationSwitch = 0

local title = display.newText( prefillText.." all", 0, 0 , native.systemFont , 12 )
title:setFillColor( 0 )
title.x, title.y =  display.contentCenterX, display.contentCenterY
title:addEventListener( "tap", function ( event )
	orientationSwitch = (orientationSwitch+1)%3
	if (orientationSwitch == 0 ) then
		orientation.lock("all")
		title.text = prefillText.." all"
	elseif (orientationSwitch == 1 ) then
		orientation.lock("landscape")
		title.text = prefillText.." landscape"
	elseif (orientationSwitch == 2 ) then
		orientation.lock("portrait")
		title.text = prefillText.." portrait"
	end
end)

timer.performWithDelay( 100, function (  )
	title.x, title.y =  display.contentCenterX, display.contentCenterY
    bg.width, bg.height = display.actualContentWidth, display.actualContentHeight
    bg.x, bg.y = display.contentCenterX, display.contentCenterY
end, -1 )
