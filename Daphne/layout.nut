//
// Daphne - Dragons's Lair
// Theme by Mahuti
// 1.0
//

class UserConfig {
	</ label="Enable Logos", help="If wheel images/logos aren't used, game titles will be shown instead.", order=1, options="show logos, show titles" />
	enable_logos="show logos";
 
}

local config = fe.get_config();

local flw = fe.layout.width;
local flh = fe.layout.height;

//Background
local bg = fe.add_image("dl_background.png", 0, 0, flw, flh);

// Snap
local snap = fe.add_artwork("snap", flw*0.1187, flh*0.110, flw*0.4289, flh*0.4925);
snap.trigger = Transition.EndNavigation;


if ( config["enable_logos"] == "show logos" )
{
 	// wheel
	local wheel = fe.add_artwork("wheel", flw*0.1187, flh*0.694, flw*0.4289, flh*0.20);
	wheel.preserve_aspect_ratio = true;
	wheel.trigger = Transition.EndNavigation;
	wheel.zorder=100;
	
} /* else {
	// Title
	local title = fe.add_text("[Title]", flw*0, flh*0.92, flw*1, flh*0.1);
	title.align = Align.Right;
	title.charsize = 24;
	title.set_rgb(247, 35, 0);
} */ 
 

// Playtime
local playtime = fe.add_text("Playtime : [PlayedTime]", flw*0.01, flh*0.93, flw*0.4, flh*0.1);
playtime.align = Align.Left;
playtime.charsize = 20;
playtime.set_rgb(255, 255, 255);

// Dirk the Daring
local borders = fe.add_image("dl_foreground.png", flw*0, flh*0, flw*1, flh*1);
borders.preserve_aspect_ratio = false;



