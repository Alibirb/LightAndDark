
extends Spatial

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initalization here
	pass


func add_help_text(message):
	get_node("help_text/text").set_text(message)
	get_node("help_text").show()

func hide_help_text():
	get_node("help_text").hide()

func set_health(amount):
	get_node("stats").set_text("Health: " + str(amount))