//
// Daphne - Dragons's Lair
// Theme by Mahuti
// 2.0 pos module added.
//

local order = 0
class UserConfig {
	</ label="Enable Logos", help="If wheel images/logos aren't used, game titles will be shown instead.", order=order++, options="show logos, show titles" />
	enable_logos="show logos";
  	</ label="Show Played Time", help="The amount of time this game's been played.", order=order++, options="Yes, No" />
	show_playtime="Yes";
}

local config = fe.get_config()

fe.load_module("preserve-art")
fe.load_module("pos") // positioning & scaling module

// stretched positioning
local posData =  {
    base_width = 1440.0,
    base_height = 1080.0,
    layout_width = fe.layout.width,
    layout_height = fe.layout.height,
    scale= "stretch",
    debug = false,
}
local pos = Pos(posData)

//Background
local bg = fe.add_image("dl_background.png", 0, 0, pos.width(1440), pos.height(1080))

// Snap
local snap = fe.add_artwork("snap", pos.x(208), pos.y(129), pos.width(513), pos.height(513))
snap.trigger = Transition.EndNavigation;

if ( config["enable_logos"] == "show logos" )
{    
	local wheel = PreserveArt("wheel", pos.x(208), pos.y(749), pos.width(513), pos.height(216))
    wheel.set_fit_or_fill("fit")
    wheel.trigger = Transition.EndNavigation;
	wheel.zorder=100;
    wheel.set_anchor(::Anchor.Centre)
	
}

// Dirk the Daring
local borders = fe.add_image("dl_foreground.png", 0, 0, pos.width(1440), pos.height(1080))

if ( config["show_playtime"] == "Yes" )
{
// Playtime            
local playtime = fe.add_text("Playtime : [PlayedTime]", pos.x(15), pos.y(1080), pos.width(576), pos.height(22))
    playtime.y = pos.y(10,"bottom",playtime)
    playtime.x = pos.y(10,"left",playtime)
    pos.set_font_height(20,playtime, "BottomLeft")
    playtime.set_rgb(255, 255, 255)	
}


