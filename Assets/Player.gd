extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var speed     = 7500.0

var sprite
var spudgun
var level1

func _ready():
	sprite = get_node("Sprite")
	spudgun = get_node("Sprite/Spudgun/SpudSprite")
	level1 = get_tree().get_root().get_node("Level1")
	if(!level1.player_has_gun):
		spudgun.hide()

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
		spudgun.set_flip_h(true)
	elif(velocity.x > 5):
		sprite.set_flip_h(false)
		spudgun.set_flip_h(false)
	else:
		pass
	
	velocity = move_and_slide(velocity)
