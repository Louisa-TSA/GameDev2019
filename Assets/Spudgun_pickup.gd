extends Area2D

var player

func _ready():
	player = get_node("../Player")

func _process(delta):
	if(overlaps_body(player) and !player.spudgun.exists):
		player.spudgun_sprite.show()
		player.spudgun.exists = true
		get_parent().remove_child(self)