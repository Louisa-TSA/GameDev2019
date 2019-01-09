extends Node2D

var exists = true
var spud = load("res://Assets/spud.tscn")
var timer = 0
var player

func _ready():
	player = get_parent().get_parent()

func _process(delta):
	timer+=delta
	if(Input.is_action_pressed("shoot") and exists
		and timer > 0.25):
		timer = 0
		var spud_instance = spud.instance()
		get_parent().get_parent().get_parent().add_child(spud_instance)
		spud_instance.go(self.global_position, direction_to_vector(player.direction_facing))

func direction_to_vector(direction):
	if(direction == player.Facing.RIGHT):
		return Vector2(0.866025, -0.5)
	elif(direction == player.Facing.LEFT):
		return Vector2(-0.866025, 0.5)
	elif(direction == player.Facing.UP):
		return Vector2(-0.866025, -0.5)
	elif(direction == player.Facing.DOWN):
		return Vector2(0.866025, 0.5)
	else:
		return direction_to_vector(player.Facing.RIGHT)
