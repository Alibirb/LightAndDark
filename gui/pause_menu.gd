
extends Spatial


func _ready():
	# Initalization here
	set_process_input(true)
	pass


func _input(ev):
	if(ev.is_action("pause") && ev.is_pressed()):
		if(get_tree().is_paused()):
			get_node("pause_popup").hide()
			get_tree().set_pause(false)
		else:
			get_tree().set_pause(true)
			get_node("pause_popup").show()