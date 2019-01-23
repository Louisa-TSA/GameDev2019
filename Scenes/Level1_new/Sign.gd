extends Area2D

var player
var popup = load("res://Popup.tscn")
var is_overlapping = false
var popup_in_scene = null

func _ready():
	player = get_node("../Player")

func _process(delta):
	if(overlaps_body(player) and is_overlapping == false):
		if(popup_in_scene == null):
			var popup_instance = popup.instance()
			add_child(popup_instance)
			popup_in_scene = get_node("Popup")
			popup_in_scene.set_text("Something")
		popup_in_scene.popup()
		is_overlapping = true
	else:
		if(popup_in_scene != null):
			if(popup_in_scene.open == false):
				is_overlapping = false