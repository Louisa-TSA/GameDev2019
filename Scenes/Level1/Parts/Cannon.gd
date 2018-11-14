extends Area2D

var player
var spudgun

func _ready():
	player = get_node("../Player")
	spudgun = player.spudgun
	
func _process(delta):
	if(overlaps_body(player)):
		spudgun.show()
		get_parent().remove_child(self)