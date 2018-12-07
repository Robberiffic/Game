/// @description Insert description here
// You can write your code in this editor
	
draw_self();

if (global.debug) {

	draw_set_font(Debug_Font);
	draw_set_color(c_blue);
	//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

	x1 = bbox_left
	x2 = bbox_right
	y1 = bbox_bottom
	y2= bbox_top
	w = 1
	//draw_line_width(x1, y1, x2, y1, w);
	//draw_line_width(x2, y1, x2, y2, w);
	//draw_line_width(x1, y2, x2, y2, w);
	//draw_line_width(x1, y1, x1, y2, w);
	
	draw_sprite(mask_index,0,x,y);
	
	dtextstr = ( " " + string(iactive_instance) + "\n x:" + string(x) + "\n y:" + string(y) + "\n " + state + "\n SI:" + string(static_index) + "\n" + string(key_inputs) + "\n" + string(key_inputs_old) );
	draw_text_transformed(x2,y2, dtextstr, .5, .5, 0);
	
	draw_text_transformed(32,32, fps, .5, .5, 0);
	
	draw_set_colour(c_lime);
	draw_line_width(centerX,centerY,ip_x_abs,ip_y_abs,1);
	draw_circle(ip_x_abs, ip_y_abs, coll_rad, true);
	//spindx = object_get_sprite(object_index);	
	//draw_sprite_ext(spindx,0,x,y,1,1,0,c_blue,0.5);   
	draw_point(cx, cy);
//}else{

}

