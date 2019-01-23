extends KinematicBody2D

var direction = Vector2()
var velocity  = Vector2()
var previous_velocity = Vector2()
var speed     = 25000.0
var timer = 0
var stop  = false
var stop_timer = 0
var is_spud = true
# var target
# var tilemap

func _ready():
	# target = get_tree().get_root().get_node("Level1/Walls/Switch")
	# tilemap = get_tree().get_root().get_node("Level1/Floor")
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
		stop_timer+=delta
		if(stop_timer > 0.05):
			get_parent().remove_child(self)
	previous_velocity = velocity
	velocity = move_and_slide(velocity)
	var collision = get_slide_collision(0)
	"""if(collision != null and collision.collider == target):
		#print(collision.collider)
		#print(Switch)
		tilemap.set_cellv(Vector2(0,1), 2, false, false, false )
		tilemap.set_cellv(Vector2(0,2), 2, false, false, false )
		tilemap.set_cellv(Vector2(0,3), 2, false, false, false )
		get_parent().remove_child(self)"""
	if(velocity != previous_velocity):
		stop = true
		velocity = Vector2(0,0)
		stop_timer = 0
	if(timer >1):
		get_parent().remove_child(self)
