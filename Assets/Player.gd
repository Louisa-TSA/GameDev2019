extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var speed     = 7500.0

var sprite
var spudgun

var no_gun_tex   = load("res://Assets/Resources/Indiv/somegoi.png")
var with_gun_tex = load("res://Assets/Resources/Indiv/characterrrr with gun.png")

enum Facing {
	LEFT,
	UP,
	RIGHT,
	DOWN
}

var direction_facing = Facing.RIGHT

func _ready():
	sprite = get_node("Sprite")
	spudgun = get_node("Sprite/Spudgun")

func _process(delta):
	
	if(spudgun.exists):
		sprite.set_texture(with_gun_tex)
	else:
		sprite.set_texture(no_gun_tex)
	
	direction = Vector2()
	
	if(Input.is_action_pressed("move_forward")):
		direction.y -= 1
	if(Input.is_action_pressed("move_backward")):
		direction.y += 1
	if(Input.is_action_pressed("move_left")):
		direction.x -= 1
	if(Input.is_action_pressed("move_right")):
		direction.x += 1
	
	if(direction.y > 0):
		direction_facing = Facing.DOWN
		sprite.region_rect = Rect2(Vector2(64, 0), Vector2(64, 128))
	elif(direction.y < 0):
		direction_facing = Facing.UP
		sprite.region_rect = Rect2(Vector2(64, 128), Vector2(64, 128))
	
	if(direction.x > 0):
		direction_facing = Facing.RIGHT
		sprite.region_rect = Rect2(Vector2(0, 128), Vector2(64, 128))
	elif(direction.x < 0):
		direction_facing = Facing.LEFT
		sprite.region_rect = Rect2(Vector2(0, 0), Vector2(64, 128))
	
	velocity = delta * direction.normalized() * speed
	
	velocity = move_and_slide(velocity)