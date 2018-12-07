/// @description Insert description here
// You can write your code in this editor

// if still typing a message letter by letter...
if (msg != msg_new)
{
	
	// image index determines how fast animation plays
	if sped_flag==1{
		im_indx += (face_time/(speedup_factor));
	}else{
		im_indx += (face_time);
	}
	
	
	// above a certain threshold, reset to zero
	if im_indx > 1{
		im_indx = 0
	}
	
	// increment where text is indexed
    j++;
	
	// kick off alarm


	 //increment printed message
	//while (!(j>=(1+string_length(msg))) && string_char_at(msg,j)!=" " ) {
	    

	//	msg_new += string_char_at(msg,j);
	//	j++;
	//}
	
	//if (string_length(msg)>=j){
	//	msg_new += " ";
	//}
	
	msg_new += string_char_at(msg,j);
	
	alarm[0] = alrm_time;
    //msg_new += string_char_at(msg,j);
	
}