
//view_xview[0] = obj_player.x + sprite_width/2 - view_wview[0]/16;
//view_yview[0] = obj_player.y + sprite_height/2 - view_hview[0]/16;

//face = get_face();

sval = 2*stepdistx/steptime;

//switch (face) {

//	case 0:
//	xshift = -sval;
//	yshift = 0;
//	break

//	case 1:
//	xshift = 0;
//	yshift = sval;
//	break

//	case 2:
//	xshift = sval;
//	yshift = 0;
//	break

//	case 3:
//	xshift = 0;
//	yshift = -sval;
//	break

	
//}


switch (sprite_index) {

	case RIGHT:
	xsh = sval;
	ysh = 0;
	break

	case UP:
	xsh = 0;
	ysh = -sval;
	break

	case LEFT:
	xsh = -sval;
	ysh = 0;
	break

	case DOWN:
	xsh = 0;
	ysh = sval;
	break

	
}


//xsh = 0;
//ysht = 0;

//x - (view_wport[0] / 2), y - (view_hport[0] / 2)
scale = 5;

vx = camera_get_view_x(view_camera[0]);
vy = camera_get_view_y(view_camera[0]);




if ( abs( (x-128) - (vx+xsh)) <= 64){
//vx += xsh;
} else {
	//vx += xsh/2;

}

if ( abs( (y-128) - (vy+ysh)) <= 64){
//vy += ysh;
} else {
	//vx += -xsh;
}


camera_set_view_pos(view_camera[0], vx,vy );


//view_set_xport(0,  (view_xport[0])-32);
//view_set_yport(0,  (view_yport[0])+32);