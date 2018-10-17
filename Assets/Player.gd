extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var speed     = 10000.0
var gravity   = -9.81

var sprite

func _ready():
	sprite = get_node("Sprite")
	pass

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
		
	if(direction.x < 0):
		sprite.set_flip_h(true)
	elif(direction.x > 0):
		sprite.set_flip_h(false)
	
	velocity = delta * direction.normalized() * speed
	# velocity.y -= gravity
	
	velocity = move_and_slide(velocity)
