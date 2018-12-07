/// @description Insert description here
// You can write your code in this editor



// draw head box, face, and frame
draw_sprite_general(Spr_head_box, 0, 0, 0, 64*3,64*3, 5*3, 3*(256-64-5), 3, 3, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite_general(face_sprite, round(im_indx), 0, 0, 64*3,64*3, 5*3, 3*(256-64-5), 3, 3, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite_general(Spr_head_box, 1, 0, 0, 64*3,64*3, 5*3, 3*(256-64-5), 3, 3, 0, c_white, c_white, c_white, c_white, 1);

// draw text box and frame
draw_sprite_general(Spr_text_box, 0, 0, 0, 246*3,40*3, (5+64)*3, 3*(256-42-5), 3, 3, 0, c_white, c_white, c_white, c_white, 1);
draw_sprite_general(Spr_text_box, 1, 0, 0, 246*3,40*3, (5+64)*3, 3*(256-42-5), 3, 3, 0, c_white, c_white, c_white, c_white, 1);

// draw text
draw_set_font(Dialogue_Font);

draw_text_ext_transformed_colour((12+64)*3-2, 3*(256-43), msg_new, 15, (360), 2 , 2, 0, c_white, c_white, c_white, c_white, 1);

