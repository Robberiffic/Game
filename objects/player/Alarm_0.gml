/// @description Insert description here
// You can write your code in this editor

// this alarm duration determines the time walked. when it elapses, a new state can be set
// static index tells the next IDLE state which static sprite to show (so facing correct direction while standing still)

switch (state){
	

	case "RIGHT": 
		static_index = 0;
		break;
		
	case "UPRIGHT": 	
		static_index = 1;
		break;
		
	case "UP": 	
		static_index = 2;
		break;
		
	case "UPLEFT": 	
		static_index = 3;
		break;
		
	case "LEFT": 			
		static_index = 4;
		break;
		
	case "DOWNLEFT": 			
		static_index = 5;
		break;
		
	case "DOWN": 			
		static_index = 6;
		break;
		
	case "DOWNRIGHT": 				
		static_index = 7;
		break;
		
}	

// find new state based on key input when timer runs out
new_state = set_state2(key_inputs);									
state = new_state;	

if state=="IDLE"{
	
	tap_flag = -1;
	
		// otherwise, set the sprite to be a static one
	sprite_index = STATIC;
	image_speed = 0;
	image_index = static_index;	
	
	
}

// only allow movement again once you've moved all the way
entry_flag = true;



