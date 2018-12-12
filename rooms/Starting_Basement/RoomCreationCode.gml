var a = layer_get_all_elements("boxes_layer");

// specify path to dialogue text file for room
//dialogue_asset_path = "\assets\dialogue\objects\basement.json"
//Room_Dialogue_Load(working_directory + "\assets\dialogue\objects\basement.json");
Room_Dialogue_Load("basement.json");


// Create layers, add depth
for (var i = 0; i < array_length_1d(a); i++;)
   {
   //if layer_get_element_type(a[i]) == layerelementtype_sprite
   //   {
   //   layer_sprite_destroy(a[i])
   //   }
	if layer_get_element_type(a[i]) == layerelementtype_sprite
		{
		  // go through each sprite of the layer
		  sprite_element_id = (a[i]);
	  
	      spr_h = sprite_get_height(layer_sprite_get_sprite(a[i]));
	  
		  // get sprite y
		  spr_y = layer_sprite_get_y(sprite_element_id);
		  spr_x = layer_sprite_get_x(sprite_element_id);
		  
		  //spr_y = sprite_get_bbox_bottom(sprite_element_id)
		  // make a new layer with the depth assigned based on y value
	  
		  //spr_layname = string(sprite_element_id) + string(spr_y)
		  
		  spr_layname = string(i);
		  new_sprlayer = layer_create(-(spr_y + spr_h - 4));
		  
		  //new_sprlayer = string(i);
		  //layer_sprite_create(new_sprlayer, spr_x, spr_y, sprite_element_id)
	  
		  layer_element_move(sprite_element_id, new_sprlayer);
		}
   }
   
   //destroy original layer
   layer_destroy("boxes_layer")