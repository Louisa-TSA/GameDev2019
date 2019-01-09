extends Area2D

var player
var delay = 1

func _ready():
	player = get_node("../Player")
	pass

func _process(delta):
	if(overlaps_body(player) and delay < 0):
		player.translate(player.to_local(Vector2(1315,10)))
		delay = 0.5
	if(delay >= 0):
		delay -= delta
	pass