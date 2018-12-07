/// @function instance_place_range(x, y, xadj, yadj, collision_obj)
/// @description instance place but for every position between current position and next position; returns closest object
/// @param {real} current x position
/// @param {real} current y position
/// @param {real} x increment
/// @param {real} y increment
/// @param {real} collision object

//instance_place( x,  y - y_tap , Coll_Obj_Master )

var xcur = argument0;
var ycur = argument1;
var xadj = argument2;
var yadj = argument3;
var collision_obj = argument4;
var _list = ds_list_create();

var lsize = 0;
var index = 0;

outinsty = noone;


var ww, hh;
ww = sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index);
hh = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index);

cx = sprite_get_bbox_right(sprite_index);
cy = sprite_get_bbox_top(sprite_index) + hh/2;


cx = (bbox_right - bbox_left)/2 + bbox_left;
cy = (bbox_bottom - bbox_top)/2 + bbox_top;


for (var i = 1; i <= 4; ++i) {
    // code here
	
	xadj0 = xadj;
	yadj0 = yadj/i;
	
	insty = instance_place( xcur + xadj0, ycur + yadj0 , collision_obj )
	
	instylist = instance_place_list( xcur + xadj0, ycur + yadj0 , collision_obj, _list, false )
	
	dist = 100;
	
	if insty!=noone{
	
		lsize = ds_list_size(_list);	

		for(index = 0; index < lsize; index++) {
	
			id_temp = _list[| index];
			
			
			cww = (id_temp.bbox_right - id_temp.bbox_left)/2 ;
			cidx0 = (id_temp.bbox_left);
			var cidx = cww + cidx0;
			
			chh = (id_temp.bbox_bottom - id_temp.bbox_top)/2;
			cidy0 = (id_temp.bbox_top);
			var cidy = cidy0 + chh;
			
			dist_new = sqrt( power(abs(cidx - cx),2) + power(abs(cidy - cy),2));
		
			if dist_new < dist {
			
				dist = dist_new;
				outinsty = id_temp;
				obby = object_get_name(outinsty.object_index);
			}
			
		}
		
		//dtest = object_get_name(insty.object_index);
		//outinsty = _list[| 0];
		
		
		
	
	}
	
	

}

return outinsty;

