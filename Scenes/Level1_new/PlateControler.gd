extends Node

var plate1
var plate2
var plate3
var plate4

var player

func _ready():
	plate1 = get_node("../Walls/Plate1")
	plate2 = get_node("../Walls/Plate2")
	plate3 = get_node("../Walls/Plate3")
	plate4 = get_node("../Walls/Plate4")
	player = get_node("../Walls/Player")

func _process(delta):
	pass
