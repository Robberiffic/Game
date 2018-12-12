/// @description Insert description here
// You can write your code in this editor

if active_flag == 1{
	
	mydialogue = Create_Dialogue();



	//Add_Dialogue(mydialogue, "Just some old basement box.");
	//Add_Dialogue(mydialogue, "There's nothing important in it.");
	//Add_Dialogue(mydialogue, "Smells like mold.");
	
	
	for (var n = 0; n < ds_list_size(dialogue_list); n++;){
				
		Add_Dialogue(mydialogue, dialogue_list[| n]);			
					
	}
	

	Play_Dialogue(mydialogue, 4, Spr_player_head, id);
	
	//active_flag = 0;
	//alarm[0] = 120;
	
}