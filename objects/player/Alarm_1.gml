/// @description Insert description here
// You can write your code in this editor

// check if the key press when timer started equals the key press when timer ended
if array_equals(key_inputs, zeros7){

	tap_flag = 1;
	tnew_state = set_state(key_inputs_old)
	alarm[0] = -1;
	
	switch (tnew_state){
	
		case "RIGHT": 
			tstatic_index = 0;
			break;
		
		case "UPRIGHT": 	
			tstatic_index = 1;
			break;
		
		case "UP": 	
			tstatic_index = 2;
			break;
		
		case "UPLEFT": 	
			tstatic_index = 3;
			break;
		
		case "LEFT": 			
			tstatic_index = 4;
			break;
		
		case "DOWNLEFT": 			
			tstatic_index = 5;
			break;
		
		case "DOWN": 			
			tstatic_index = 6;
			break;
		
		case "DOWNRIGHT": 				
			tstatic_index = 7;
			break;
			
		case "IDLE": 				
			tstatic_index = static_index;
			break;
		
	}	
	
		// if you have released already, it's a tap
	if tstatic_index != static_index{
		tap_flag = 1;
	}else{
		tap_flag = 0;
		
		sprite_index = STATIC;
		image_speed = 0;
		image_index = static_index;	
		
	}

}else{
	
	// if still holding, it's a hold;	
	tap_flag = 0;

}

// now that we know if it's a tap or hold, allow movement again
move_flag = true;
