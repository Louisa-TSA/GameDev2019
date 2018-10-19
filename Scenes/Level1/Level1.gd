extends Spatial

var exit_timer = 0.0
var exit_delay = 0.50

func _ready():
	pass

func _process(delta):
	if(Input.is_action_pressed("ui_cancel")):
		exit_timer += delta
	else:
		exit_timer = 0.0
		
	if(exit_timer >= exit_delay):
		get_tree().quit()
