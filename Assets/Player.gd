extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var speed     = 7500.0

var sprite
var spudgun_sprite
var spudgun
var has_spudgun = false

enum Facing {
	LEFT,
	UP,
	RIGHT,
	DOWN
}

var direction_facing = Facing.RIGHT

func _ready():
	sprite = get_node("Sprite")
	spudgun_sprite = get_node("Sprite/Spudgun/SpudSprite")
	spudgun = get_node("Sprite/Spudgun")
	if(!self.has_spudgun):
		spudgun_sprite.hide()
		spudgun.exists = false

func _process(delta):
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
	elif(direction.y < 0):
		direction_facing = Facing.UP
	
	if(direction.x > 0):
		direction_facing = Facing.RIGHT
	elif(direction.x < 0):
		direction_facing = Facing.LEFT
	
	velocity = delta * direction.normalized() * speed
	
	if(velocity.x < -5):
		sprite.set_flip_h(true)
		spudgun_sprite.set_flip_h(true)
	elif(velocity.x > 5):
		sprite.set_flip_h(false)
		spudgun_sprite.set_flip_h(false)
	else:
		pass
	
	velocity = move_and_slide(velocity)

