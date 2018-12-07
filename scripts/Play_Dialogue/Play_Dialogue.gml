if (instance_exists(Obj_Dialogue_Box)){


// dialogue input
// text speed input
// face_sprite input


}else{
	
	with(instance_create_depth(5,256 - 64 - 5,0, Obj_Dialogue_Box)){
		
		dialogue = argument0;
		text_speed = argument1;
		face_sprite = argument2;
		callid = argument3;
		
		event_user(0);
		
	}
	
}
	
