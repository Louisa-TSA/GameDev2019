extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player

func _ready():
	player = get_node("../Player")
	
func _process(delta):
	if(overlaps_body(player)):
		get_tree().change_scene("res://Scenes/Level1/Parts/Level1Part1.tscn")
