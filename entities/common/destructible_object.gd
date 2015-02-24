
extends CollisionObject

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	pass
	#if(self extends RigidBody):
	#	set_mass(0)

func _integrate_forces(state):
	for i in range(state.get_contact_count()):
		var cc = state.get_contact_collider_object(i)
		var dp = state.get_contact_local_normal(i)
	
		if (cc):
			if (cc extends preload("res://entities/players/player_standin/spear.gd") and not cc.disabled ):
				self.queue_free()
				print("Barrier should be destroyed now.")
				cc.disabled = true
				return

func _on_body_enter( body ):
	#pass # replace with function body
	if (body extends preload("res://entities/players/player_standin/spear.gd") and not body.disabled ):
		self.queue_free()
		print("Barrier should be destroyed now.")
	#self.queue_free()
	#print("Barrier should be destroyed now.")
