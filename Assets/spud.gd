extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var previous_velocity = Vector2()
var speed     = 25000.0
var timer = 0
var stop  = false
var stop_timer = 0



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
	
	if(stop == false):
		velocity = delta * direction.normalized() * speed
	else:
		stop_timer+=delta;
		if(stop_timer > 0.05):
			get_parent().remove_child(self)
	previous_velocity = velocity;
	velocity = move_and_slide(velocity)
	if(velocity != previous_velocity):
		stop = true;
		velocity = Vector2(0,0);
		stop_timer = 0;
	if(timer >1):
		get_parent().remove_child(self)
