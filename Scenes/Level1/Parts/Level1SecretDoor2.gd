extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var player

func _ready():
	player = get_node("../Player")
	
func _process(delta):
	if(overlaps_body(player)):
		player.level1.load_part_1()
