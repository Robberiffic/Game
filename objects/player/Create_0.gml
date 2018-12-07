/// @desc Initialize
var ww, hh;
ww = sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index);
hh = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);

cx = x + 10;
cy = y + hh;

// State and control variables
state = "IDLE";					// start in IDLE state
sprite_index = STATIC;			// use the static sprite
static_index = 0;				// sprite looking down
mask_index = player_collision;	// assign collision mask
image_speed = 0;				// set sprite image speed to 0

iactive_instance = 0;

entry_flag = true;				// enable key entry
tap_flag = -1;					// initialize tap flag (-1: neither)
tap_hold_timer = 10;			// set timer for telling taps from holds
key_inputs_old = [0,0,0,0,0,0,0];	// initialize empty key input array (prior)
key_inputs = [0,0,0,0,0,0,0];		// initialize empty key input array (current)

// initialize movement parameters
dir = 0;						// initial direction is 0
stepdistx = 32/2/2;				// step distance x covered by a step interval
stepdisty = 16/2;				// step distance y...
steptime = 8;					// time to execute step interval
hspd = stepdistx/(steptime);	// individual increments per frame in step interval
vspd = stepdisty/(steptime);
walk_anim_speed = (1/1.5)*(6/8);// walk animation speed

// interaction point
ip_ang = dir;
ip_dist = 20;

// macros for player direction sprites
#macro STATIC player_idle
#macro RIGHT player_right
#macro LEFT player_left
#macro UP player_up
#macro DOWN player_down
#macro DOWNRIGHT player_downright
#macro DOWNLEFT player_downleft
#macro UPRIGHT player_upright
#macro UPLEFT player_upleft
