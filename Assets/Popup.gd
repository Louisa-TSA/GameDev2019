extends WindowDialog

var textbox
var open = false

func _ready():
	textbox = get_node("RichTextLabel")

func set_text(text):
	textbox.set_bbcode(text)
	
func _notification(what):
	if(what == NOTIFICATION_POPUP_HIDE):
		open = false
	elif(what == NOTIFICATION_POST_POPUP):
		open = true
		
func about_to_show(player):
	# set_position(Vector2(player.global_position.x,player.global_position.y))