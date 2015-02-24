
# base class for players. Currently doesn't do much. Will move common functionality into here later.


extends RigidBody


export var health = 4


func _ready():
	get_node("/root/world/hud").call("set_health", health)

func is_active_player():
	return true

func take_damage(amount):
	health -= amount
	get_node("/root/world/hud").call("set_health", health)
	if(health <= 0):
		die()

func die():
	print("Crap. I'm dead.")