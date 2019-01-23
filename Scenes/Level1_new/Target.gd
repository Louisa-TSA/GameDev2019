extends Area2D

var tilemap

func _ready():
	tilemap = get_tree().get_root().get_node("Level1/Floor")

func _process(delta):
	# if coliiding object has .is_spud
	var colliding_bodies = get_overlapping_bodies()
	for i in colliding_bodies:
		if not i.get('is_spud') ==	 null:
			tilemap.set_cellv(Vector2(0,1), 2, false, false, false )
			tilemap.set_cellv(Vector2(0,2), 2, false, false, false )
			tilemap.set_cellv(Vector2(0,3), 2, false, false, false )
			get_parent().remove_child(self)
	pass