if place_meeting(x,y,instance_nearest(x, y,obj_bullet))//check collision with bullet
{
	finished_atk = scr_enemhit(def);
	hp -= finished_atk;	
}
	

if hp<=0{
	global.k_exp += experience;
	instance_destroy(self);
} 