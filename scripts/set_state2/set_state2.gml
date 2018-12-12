/// @function set_state(keyinputs)
/// @description sets the player state based on key inputs
/// @param {real} keyinputs value ranging -1 to 1 for xaxis movement

var key_inputs = argument[0];

#region Setup Faces and Tap Parameters
// separate inputs
rK = key_inputs[0];
lK = key_inputs[1];
dwnK = key_inputs[2];
uK = key_inputs[3];
aK = key_inputs[4];
sK = key_inputs[5];
dK = key_inputs[6];

y_tap = abs(tap_flag-1)*stepdistx;
x_tap = abs(tap_flag-1)*stepdistx;

// movement axes
xaxis = (rK - lK);
yaxis = (dwnK - uK);

// Get direction based on axes
dir = point_direction(0,0, xaxis, yaxis);

// Assign state based on direction (8-directional)
face = round(dir/45);	
if (face == 8) {
	face = 0;
}

// If there were no inputs, set face to -1 so we don't accidentally spin
if (xaxis==0) && (yaxis==0){
	face = -1;
}
#endregion


// initialize empty strings for UP/DOWN, LEFT/RIGHT components of direction state name	
ret1 = "";
ret2 = "";

#region If moving right...
// if moving in a direction with a RIGHT component
if (face==0 || face==1 || face==7 ){

		// if you're not running into anything, and you're moving UPRIGHT...
		if ( face==1 )&&(noone==instance_place_range( x,  y, 0, -y_tap , Coll_Obj_Master )){
			
		//if ( face==1 )&&(noone==instance_place_range(x, y, 0, -y_tap, Coll_Obj_Master)){
			
			ret2 = "UP"; 
		}
		// if you're not running into anything, and you're moving DOWNRIGHT...
		if ( face==7 )&&(noone==instance_place_range( x, y, 0, +y_tap, Coll_Obj_Master )){
			ret2 = "DOWN"; 		
		}
		
		// check what you run into if you're just moving right
		inst = instance_place_range(	x, y, +x_tap, 0, Coll_Obj_Master);
		if (tap_flag)||(inst==noone){
			ret1 = "RIGHT"; 
		}else{
			
			// if there's something there, check if it's sloped
			if (face==0){	
				coll_test = object_get_name(inst.object_index);
			
				// assign appropriate state based on object slope
				if (coll_test == "Coll_Obj_UL") && noone==instance_place_range( x,  y, 0, -y_tap, Coll_Obj_Master ){
						ret1 = "RIGHT";
						ret2 = "UP";
				}
				if (coll_test == "Coll_Obj_DL") && noone==instance_place_range( x ,  y, 0, +y_tap, Coll_Obj_Master){
						ret1 = "RIGHT";
						ret2 = "DOWN";
				}
			}
			
		}
	
		
}
#endregion

#region If Moving Left...
// same for leftward movement
if (face==3 || face==4 || face==5 ){	
	
			
		if (face==3 )&&(noone==instance_place_range( x,y, 0, -y_tap , Coll_Obj_Master)){
			ret2 = "UP"; 		
		}
		if (face==5 )&&(noone==instance_place_range( x , y, 0, +y_tap , Coll_Obj_Master )){
			ret2 = "DOWN"; 			
		}	
		
		inst = instance_place_range(	x, y, -x_tap, 0, Coll_Obj_Master);
		if (inst==noone){
			ret1 = "LEFT"; 
		}else{
				
			if (face == 4){	
				coll_test = object_get_name(inst.object_index);
			
				if (coll_test == "Coll_Obj_UR") && noone==instance_place_range( x,  y, 0, -y_tap , Coll_Obj_Master ){
						ret1 = "LEFT";
						ret2 = "UP";
				}
				if (coll_test == "Coll_Obj_DR") && noone==instance_place_range( x , y, 0, +y_tap, Coll_Obj_Master){
						ret1 = "LEFT";
						ret2 = "DOWN";
				}
			}
			
		}

				
	
}
#endregion

#region If Moving Up...
// Sliding for up movement
inst = instance_place_range(x,  y, 0, -y_tap, Coll_Obj_Master)
if (face==2){
	
	if (inst==noone){
		ret1 = "UP"; 			
	}else{
	
		coll_test = object_get_name(inst.object_index);
		if (coll_test == "Coll_Obj_DR") && noone==instance_place_range( x, y, x_tap,  0, Coll_Obj_Master ){
		//if (coll_test == "Coll_Obj_DR") && noone==instance_place_range( x, y , x_tap,  y, Coll_Obj_Master ){
				ret1 = "RIGHT";
				ret2 = "UP";
		}
		if (coll_test == "Coll_Obj_DL") && noone==instance_place_range( x, y, -x_tap, 0, Coll_Obj_Master ){
				ret1 = "LEFT";
				ret2 = "UP";
		}
	
	}
	
}				
#endregion

#region If moving down...
// Sliding for down movement
inst = instance_place_range(	x,  y , 0, +y_tap, Coll_Obj_Master)
if (face==6){			
	
	if (inst==noone){
		ret1 = "DOWN"; 			
	}else{
	
		coll_test = object_get_name(inst.object_index);
		if (coll_test == "Coll_Obj_UR") && noone==instance_place_range( x, y, +x_tap, 0, Coll_Obj_Master ){
				ret1 = "RIGHT";
				ret2 = "DOWN";
		}
		if (coll_test == "Coll_Obj_UL") && noone==instance_place_range( x, y, -x_tap, 0, Coll_Obj_Master ){
				ret1 = "LEFT";
				ret2 = "DOWN";
		}
	
	}

}		
#endregion

// combine string components of state names		
ret = ret2 + ret1;

if ret!=""{
		
	// if entering a movement state, kick off the time and start animating sprite
	alarm[0] = steptime;			
	image_speed = walk_anim_speed;
		
}else{
		
	// otherwise, return that you're still IDLE
	ret = "IDLE";
	tap_flag = -1;
	entry_flag = true;
}


return ret
