/// @desc




// depth
depth = -bbox_bottom;

// get key inputs
key_inputs_last = key_inputs;	// save off old key inputs
key_inputs = get_input();		// get new key inputs	

// right_Key, left_Key, down_Key, up_Key, a_Key, s_Key, d_Key
zeros7 = [0,0,0,0,0,0,0];

// if we aren't already checking, and there are new key inputs, check for hold or tap
if (state=="IDLE")&&(entry_flag==true) && (!array_equals(key_inputs, zeros7)){
	
	key_inputs_old = key_inputs;
	
	// don't allow a check for a new input until the move is made (re-enables on completion of Alarm[0]
	entry_flag = false;
	
	// start checking timer (tap check duration)
	alarm[1] = tap_hold_timer;
	
}

// set move distance to 0 if tap is happening
if tap_flag==1{
	vspd = 0;
	hspd = 0;		
}else{	// return to default if a hold is happening	
	hspd = stepdistx/(steptime);
	vspd = stepdisty/(steptime);	
}


// start in an IDLE state
if (state=="IDLE"){ 
						
		// only change states when key inputs detected
		if !array_equals(key_inputs_old, zeros7) {
								
			if (tap_flag!=-1){
				// find new state based on collision and key inputs					
				new_state = set_state2(key_inputs_old);									
				state = new_state;																
			}
				
		}else{	
							
			// otherwise, set the sprite to be a static one
			sprite_index = STATIC;
			image_speed = 0;
			image_index = static_index;	
		}		
				
}


// if you moved to a new state, move accordingly and select the correct sprite
switch (state){
				
	case "RIGHT": 
	
		sprite_index = RIGHT;
		x += hspd;			
		break;
		
	case "UPRIGHT": 	
		sprite_index = UPRIGHT;
		x += hspd
		y -= vspd*.5;
		break;
	
	case "UP": 	
		sprite_index = UP;
		y -= vspd;
		break;
		
	case "UPLEFT": 	
		sprite_index = UPLEFT;
		y -= vspd*.5;
		x -= hspd;
		break;
		
	case "LEFT": 			
		sprite_index = LEFT;
		x -= hspd;
		break;
		
	case "DOWNLEFT": 			
		sprite_index = DOWNLEFT;
		y += vspd*.5;
		x -= hspd;
		break;
		
	case "DOWN": 			
		sprite_index = DOWN;
		y += vspd;
		break;
		
	case "DOWNRIGHT": 				
		sprite_index = DOWNRIGHT;
		y += vspd*.5;
		x += hspd;
		break;
}


// line of interaction movement

// adjust to isometric coordinates by tailoring line angle
angle_to_iso = static_index*45;
switch (angle_to_iso) {
	case 45:
		angle_to_iso = 30;
	break;
	case 135:
		angle_to_iso = 150;
	break;
	case 225:
		angle_to_iso = 210;
	break;
	case 315:
		angle_to_iso = 330;
	break;
}

// offset from player center
ip_x = ip_dist*dcos(angle_to_iso);
ip_y = -ip_dist*dsin(angle_to_iso);

// player center
centerX = x - sprite_get_xoffset(0) + 10;
centerY = y - sprite_get_yoffset(0) + 18;

// coordinates
ip_x_abs = ip_x/2 + centerX;
ip_y_abs = ip_y/2 + centerY;
coll_rad = ip_dist/2;

//script_execute(enemy_collision_check);
//shift_camera();

// interaction code

// if A key is pressed and the interaction point is over the interaction master...
if (key_inputs[4]==1){
	
	//collision_circle(x, y, 20, obj_Cursor, false, true)
	
	iactive_instance = collision_circle( ip_x_abs,  ip_y_abs, coll_rad, Obj_iactive_master, false, true );
	
	if iactive_instance!=noone{
	
		with( iactive_instance )
		{
			event_perform(ev_other, ev_user0);
		}
	
		//event_perform_object(iactive_instance.object_index , ev_user0, 0);
	
	}
	
}
	

