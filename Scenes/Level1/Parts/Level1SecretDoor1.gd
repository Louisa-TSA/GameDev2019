extends Area2D

var player

func _ready():
	player = get_node("../Player")

func _process(delta):
	if(overlaps_body(player)):
		player.level1.load_part_2()
		# player.translate(Vector2(-32,32))
