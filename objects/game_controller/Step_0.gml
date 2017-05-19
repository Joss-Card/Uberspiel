
       var make_b;

// ~~~ DEBUG FUNCTION ~~~ //
if keyboard_check_pressed(ord("R ")){
	room_restart();
}

// cursor changes
if (position_meeting(mouse_x, mouse_y, obj_block)){
	cursor_sprite = spr_chat;
	
} 
else cursor_sprite = spr_target;

if (can_fire == true) && mouse_check_button(mb_left) && instance_exists(obj_knack)
{
	can_fire = false;
	alarm_set(0, 100-fire_speed);
                
        direction = (point_direction(obj_knack.x,obj_knack.y,mouse_x,mouse_y));
         
    
}  

/* Need to decide if bullets are automatic or click-per-shot. Also need to make 
ammo counter and bullet delay.*/

//~~~ LEVEL UP CODE ~~~\\

if keyboard_check_pressed(ord("L")) && global.k_lvl <=99{

	global.k_lvl += 1;
	global.k_def += random_range(1,3);
	global.k_atk += random_range(1,3);
	global.k_spd += random_range(0.1, 0.5);
	
	instance_create_layer(obj_knack.x-64, obj_knack.y-36,"Instances", obj_level_text);


}

 