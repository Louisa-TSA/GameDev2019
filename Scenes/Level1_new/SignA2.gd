extends Area2D

var player
var popup = load("res://Popup.tscn")
var is_overlapping = false
var popup_in_scene = null

func _ready():
	player = get_node("../Player")

func _process(delta):
	if(overlaps_body(player) and is_overlapping == false):
		print("DCHLDSKHHDFJILDSF")
		if(popup_in_scene == null):
			var popup_instance = popup.instance()
			add_child(popup_instance)
			popup_in_scene = get_node("Popup")
			popup_in_scene.name = "Popup2"
			print("DJLSDJLLJSDHJLSFKJFSJKLJKLSFJKSFJKLFSJKJKSFHJKSFHKFS")
			popup_in_scene.set_text("The switch next to the sealed gate should be flipped immediatly before the last")
		popup_in_scene.popup_centered()
		is_overlapping = true
	else:
		if(popup_in_scene != null):
			if(popup_in_scene.open == false):
				is_overlapping = false