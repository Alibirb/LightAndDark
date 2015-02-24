
extends Area

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	pass

func _on_body_enter(body):
	if(body extends preload("res://entities/common/destructible_object.gd")):
		body.queue_free()
	print("body enter")
