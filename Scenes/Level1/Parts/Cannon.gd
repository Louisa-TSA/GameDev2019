extends Area2D

var player
var spudgun
var level1

func _ready():
	player = get_node("../Player")
	spudgun = player.spudgun
	level1 = get_tree().get_root().get_node("Level1")
	
func _process(delta):
	if(overlaps_body(player)):
		level1.attain_gun()
		spudgun.show()
		get_parent().remove_child(self)