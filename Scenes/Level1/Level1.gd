extends Node2D

var exit_timer = 0.0
var exit_delay = 0.50

func _ready():
	load_part_1()
	pass

func _process(delta):
	if(Input.is_action_pressed("ui_cancel")):
		exit_timer += delta
	else:
		exit_timer = 0.0
		
	if(exit_timer >= exit_delay):
		get_tree().quit()

func load_part_1():
	get_tree().change_scene("res://Scenes/Level1/Parts/Level1Part1.tscn")
	pass