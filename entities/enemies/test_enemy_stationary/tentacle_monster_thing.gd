
extends RigidBody


const STATE_IDLE = 0
const STATE_DYING = 1

                                     
var prev_advance = false
var deaccel = 20.0
var accel = 5
var max_speed = 2
var rot_dir = 4
var rot_speed = 1

var dying=false

func _integrate_forces(state):
	
	var delta = state.get_step()
	var lv = state.get_linear_velocity()
	var g = state.get_total_gravity()

	#lv += g * delta #apply gravity
	var up = -g.normalized()
	
	#state.set_linear_velocity(lv)

	if (dying):
		state.set_linear_velocity(lv)
		return
		
	for i in range(state.get_contact_count()):
		var cc = state.get_contact_collider_object(i)
		var dp = state.get_contact_local_normal(i)
	
		if (cc):
			print("collision detected")
			if (cc extends preload("res://entities/players/player_standin/spear.gd") and not cc.disabled ):
				print("dying")
				set_mode(MODE_RIGID)
				dying=true
				#lv=s.get_contact_local_normal(i)*400
				state.set_angular_velocity( -dp.cross(up).normalized() *33.0)
				#get_node("AnimationPlayer").play("impact")
				#get_node("AnimationPlayer").queue("explode")
				get_node("AnimationPlayer").play("die")
				set_friction(true)
				cc.disabled = true
				#get_node("sound").play("hit")
				return
				
	





func _ready():
	# Initalization here
	pass


