/// @description Insert description here
// You can write your code in this editor
	
//draw_self();
depth = -10000;

if (global.debug) {

	draw_set_font(Debug_Font);
	draw_set_color(c_blue);
	//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

	x1 = Player.bbox_left
	x2 = Player.bbox_right
	y1 = Player.bbox_bottom
	y2 = Player.bbox_top
	w = 1

	
	draw_sprite(Player.mask_index,0,Player.x,Player.y);
	
	dtextstr = ( " " + string(Player.iactive_instance) + "\n x:" + string(Player.x) + "\n y:" + string(Player.y) + "\n " + Player.state + "\n SI:" + string(Player.static_index) + "\n" + string(Player.key_inputs) + "\n" + string(Player.key_inputs_old) );
	draw_text_transformed(x2,y2, dtextstr, .5, .5, 0);
	
	draw_text_transformed(32,32, fps, .5, .5, 0);
	
	draw_set_colour(c_lime);
	draw_line_width(Player.centerX,Player.centerY,Player.ip_x_abs,Player.ip_y_abs,1);
	draw_circle(Player.ip_x_abs, Player.ip_y_abs, Player.coll_rad, true);
	//spindx = object_get_sprite(object_index);	
	//draw_sprite_ext(spindx,0,x,y,1,1,0,c_blue,0.5);   
	draw_point(Player.cx, Player.cy);
	draw_sprite_ext(ISO_GRID,0,0,0,1,1,0,c_white,.2);
	
//}else{

}

