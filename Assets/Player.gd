extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var speed     = 7500.0

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
	
	velocity = delta * direction.normalized() * speed
	
	if(velocity.x < -5):
		sprite.set_flip_h(true)
	elif(velocity.x > 5):
		sprite.set_flip_h(false)
	else:
		pass
	
	velocity = move_and_slide(velocity)
