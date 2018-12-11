extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var speed     = 10000.0
var timer = 0



func _ready():
	pass
	
func go(coordinate, direction):
	self.global_position.x = coordinate.x
	self.global_position.y = coordinate.y
	self.direction = direction


func _process(delta):
	timer +=delta
	if(timer>10):
		get_parent().remove_child(self)
	
	velocity = delta * direction.normalized() * speed
	velocity = move_and_slide(velocity)
	
	if(velocity < Vector2(1, 1) and timer >1):
		get_parent().remove_child(self)
