//collides with block object
if place_meeting(x, y, obj_block){
	instance_create_layer(x,y,"Instances", obj_bullet_hit);
	instance_destroy(self);
}
 
//bullet despawns, x axis
else if (abs(xstart - x) >= 256){
	instance_destroy(self);
}
//bullet despawns, y axis
else if (abs(ystart - y) >= 128){
	instance_destroy(self);
}