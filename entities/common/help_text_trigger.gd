extends Area


export var help_text = ""



func _ready():
	# Initalization here
	connect("body_enter", self, "_on_trigger_body_enter")
	connect("body_exit", self, "_on_trigger_body_exit")


func _on_trigger_body_exit( body ):
	if (body extends preload("res://entities/players/common/player_base.gd") and body.is_active_player()):
		var hud = get_node("/root/world/hud")
		hud.call("hide_help_text")


func _on_trigger_body_enter( body ):
	if (body extends preload("res://entities/players/common/player_base.gd") and body.is_active_player()):
		var hud = get_node("/root/world/hud")
		hud.call("add_help_text", help_text)

