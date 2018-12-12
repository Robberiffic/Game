path_text = argument0;

var theJsonFile = file_text_open_read(path_text);
var theData = "";
while (!file_text_eof(theJsonFile))
{
    theData += file_text_read_string(theJsonFile);
    file_text_readln(theJsonFile);
}
file_text_close(theJsonFile);



type = Obj_look;



var resultMap = json_decode(theData);
var list = ds_map_find_value(resultMap, "default");
var size = ds_list_size(list);

for (var n = 0; n < ds_list_size(list); n++;)
   {
	   
	var map = ds_list_find_value(list, n);
     
	var ID = ds_map_find_value(map, "ID");
	var NAME = ds_map_find_value(map, "NAME");
	var DIALOGUE = ds_map_find_value(map, "DIALOGUE");
	
		var ii = 0;
		
		while( instance_find(type, ii) != noone ){
			
			temp_id = instance_find(type, ii);
			
			name_test = temp_id.name;
			
			if name_test == NAME{
				
				for (var m = 0; m < ds_list_size(DIALOGUE); m++;){
				
					with (temp_id){
						ds_list_set(dialogue_list, m, DIALOGUE[| m]);
						//temp = DIALOGUE[| m];
					}
				}
				
			}
			
		    //temp_id = string_split(temp_id, "_");
			ii++;
		
		
		
		}
	
        
	ds_map_destroy(map);
    //ds_map_destroy(ID);
	//ds_map_destroy(NAME);
	//ds_list_destroy(NAME);
   }
   
ds_list_destroy(list);
ds_map_destroy(resultMap);

