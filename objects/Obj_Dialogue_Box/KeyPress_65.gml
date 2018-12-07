/// @description Insert description here
// You can write your code in this editor

// if the message is still typing when the a key is hit,
if (msg != msg_new){
	
	// speed up text by reducing the alarm time
	alrm_time = alrm_time/speedup_factor;

	// if it's already been sped up, just go ahead and print all the text
	if sped_flag==1{
		msg_new = msg;
		im_indx = 0;
		sped_flag = 1;
		alrm_time = alrm_time*speedup_factor;
	}	
	// now mark that it has been sped up
	sped_flag = 1;
	
}else{

	// if the whole message has been printing, trigger the event_user again (go to next dialogue line)
	im_indx = 0;
	sped_flag = 0;
	alrm_time = alrm_time*speedup_factor;
	event_user(0);
	
}