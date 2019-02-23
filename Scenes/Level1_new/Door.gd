extends Node

var player
var delay = 1

var player_off_door

var door1
var door2

var locked = false

func _ready():
	player = get_node("../Player")
	door1 = get_node("1")
	door2 = get_node("2")

func _process(delta):
	if(delay < 0 and not locked):
		if(door1.overlaps_body(player) or door2.overlaps_body(player)):
			if(door1.overlaps_body(player) and player_off_door):
				player.translate(player.to_local(door2.global_transform.get_origin()))
				delay = 0.5
			if(door2.overlaps_body(player) and player_off_door):
				player.translate(player.to_local(door1.global_transform.get_origin()))
				delay = 0.5
			player_off_door = false
		else:
			player_off_door = true
	if(delay >= 0):
		delay -= delta