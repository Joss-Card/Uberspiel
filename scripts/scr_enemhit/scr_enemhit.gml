///Enemy Gets Hit
// set variables
near_bullet = instance_nearest(x,y,obj_bullet);
def = argument0;

//create bullet hit, destroy old bullet
instance_create_layer(near_bullet.x, near_bullet.y, "Instances", obj_bullet_hit);
instance_destroy(near_bullet);
// set near_hit variable after obj_bullet_hit is spawned
near_hit = instance_nearest(x,y,obj_bullet_hit);

//calculate damage
finished_atk = ((2 * global.k_atk)- def);
random_atk = choose((finished_atk*.25),(finished_atk*-.25),0);
finished_atk += random_atk;
finished_atk = round(finished_atk);
//set damage text output
game_controller.finished_atk = finished_atk;
//call damage text, return 
//instance_create_layer(obj_bullet_hit.x-8, obj_bullet_hit.y-16,"Instances", obj_dmg_text);
instance_create_layer(near_hit.x-8, near_hit.y-16, "Instances", obj_dmg_text);
return finished_atk; 
