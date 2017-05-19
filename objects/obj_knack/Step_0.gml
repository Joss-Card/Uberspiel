/// Knack Movement


//player input
key_right = keyboard_check(ord("D"));
key_left = -keyboard_check(ord("A"));
key_jump = keyboard_check_pressed(vk_space);

//React to inputs
move = keyboard_check(ord("D")) - keyboard_check(ord("A"));



hsp = move * movespeed;

if (vsp < 10) vsp += grav;

if (keyboard_check_pressed(vk_space) &&((place_meeting(x, y+1, obj_block))) ) {
	vsp = -jumpspeed;
	
}
//if (place_meeting(x, y+1, obj_block)){
	
//	vsp = keyboard_check_pressed(vk_space) * -jumpspeed;
//}


//Horizontal collision
if (place_meeting(x+hsp, y, obj_block)){
	while (!place_meeting(x+sign(hsp), y, obj_block))
	{
		x += sign(hsp);
	} 
	hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x, y+vsp, obj_block)){
	while (!place_meeting(x, y+sign(vsp), obj_block))
	{
		y += sign(vsp);
	} 
	
	vsp = 0;
}
y += vsp;

//Animation
/* if (mouse_x - x) > 0 ~~OR~~ if (mouse_x - x) <0 
in conjunction with the move variable can set keep Knack facing the right way
*/
//face right

if ((mouse_x - x) > 0){ 
	image_xscale = -1;
	if (move==1) && (vsp = 0){ // face right move right
		image_speed = 1;
	}
	else if (move == -1) && (vsp = 0){ //face right move left
		image_speed = -1;
	}
	else {
		image_index = 0;
		image_speed = 0;
	}
}	
// face left
else if ((mouse_x -x) < 0){
	image_xscale = 1;
	if (move==1) && (vsp = 0){ // face left move right
		image_speed = -1;
	}
	else if (move == -1) && (vsp = 0){ // face left move left
		image_speed = 1;
	}
	else {
		image_index = 0;
		image_speed = 0;
	}
}

