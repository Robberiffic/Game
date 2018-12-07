/// @description Insert description here
// You can write your code in this editor




// take message out of message queue
value = ds_queue_dequeue(dialogue);

// if there's nothing left, kill dialogue object
if(is_undefined(value)){	
	
	
	callid.active_flag = 0;
	callid.alarm[0] = 60;
	
	instance_destroy();
	
}


// these determine the speed at which text is drawn/spoken
alrm_time = (text_speed)
// face speed factor
face_time = .4;
speedup_factor = 4;

// starting index in talk animation
im_indx = 0;

// track whether the text speech has been sped up yet or not
sped_flag = 0;

// kickoff typing...
alarm[0] = alrm_time;
j = 0;
msg = value;
msg_new = "";

