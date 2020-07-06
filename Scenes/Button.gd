extends Button

func _ready():
	pass

func _pressed():
	get_parent().get_node("ButtonDeny").play()
	GlobalVariables.current_animation = "fade_out"
	GlobalVariables.next_scene = "res://Scenes/MainMenu.tscn"
	get_parent().add_child(GlobalVariables.transition.instance())
