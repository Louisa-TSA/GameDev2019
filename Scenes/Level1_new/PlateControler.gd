extends Node

var plate1
var plate2
var plate3
var plate4

var player

var door

var p1p = false
var p2p = false
var p3p = false
var p4p = false

var popup = load("res://Popup.tscn")
var popup_in_scene = null

var unlocked = false

func _ready():
	plate1 = get_node("../Walls/Plate1")
	plate2 = get_node("../Walls/Plate2")
	plate3 = get_node("../Walls/Plate3")
	plate4 = get_node("../Walls/Plate4")
	player = get_node("../Walls/Player")
	door   = get_node("../Walls/Door3" )

func _process(delta):
	if(not unlocked):
		if(plate1.overlaps_body(player)):
			if(not p2p and not p3p and not p4p):
				p1p = true
			else:
				reset_plates()
		if(plate2.overlaps_body(player)):
			if(p1p and not p3p and not p4p):
				p2p = true
			else:
				reset_plates()
		if(plate3.overlaps_body(player)):
			if(p1p and p2p and not p4p):
				p3p = true
			else:
				reset_plates()
		if(plate4.overlaps_body(player)):
			if(p1p and p2p and p3p):
				p4p = true
			else:
				reset_plates()
		if(p1p and p2p and p3p and p4p):
			door.locked = false
			if(popup_in_scene == null):
				var popup_instance = popup.instance()
				get_tree().get_root().get_node("Level1/CanvasLayer").add_child(popup_instance)
				popup_in_scene = get_tree().get_root().get_node("Level1/CanvasLayer").get_node("Popup")
				popup_in_scene.about_to_show(player)
			popup_in_scene.set_text("Gate unlocked!")
			popup_in_scene.popup()
			unlocked = true
		else:
				door.locked = true

func reset_plates():
	if(popup_in_scene == null):
		var popup_instance = popup.instance()
		get_tree().get_root().get_node("Level1/CanvasLayer").add_child(popup_instance)
		popup_in_scene = get_tree().get_root().get_node("Level1/CanvasLayer").get_node("Popup")
		popup_in_scene.about_to_show(player)
	popup_in_scene.set_text("Incorrect plate order!")
	popup_in_scene.popup()
	p1p = false
	p2p = false
	p3p = false
	p4p = false