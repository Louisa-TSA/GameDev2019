extends Node2D

var exit_timer = 0.0
var exit_delay = 0.50
var part1 = load("res://Scenes/Level1/Parts/Level1Part1.tscn")
var part2 = load("res://Scenes/Level1/Parts/Level1Part2.tscn")
var part1_instance = part1.instance()
var part2_instance = part2.instance()

var player_has_gun = false

var player

func _ready():
	part1_instance.set_name("part1")
	part2_instance.set_name("part2")
	load_part_1()
	pass

func _process(delta):
	if(Input.is_action_pressed("ui_cancel")):
		exit_timer += delta
	else:
		exit_timer = 0.0
		
	if(exit_timer >= exit_delay):
		get_tree().quit()

func load_part_1():
	if(get_node("part2")):
		remove_child(get_node("part2"))
	add_child(part1_instance)
	player = get_node("part1/Walls/Player")
	if(player_has_gun):
		player.spudgun_sprite.show()
		player.spudgun.make_exist()
	player.move_and_slide(Vector2(-1000,650))
	pass

func load_part_2():
	if(get_node("part1")):
		remove_child(get_node("part1"))
	add_child(part2_instance)
	player = get_node("part2/Walls/Player")
	player.move_and_slide(Vector2(1000,-650))
	pass

func attain_gun():
	player_has_gun = true