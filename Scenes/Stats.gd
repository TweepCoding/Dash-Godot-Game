extends Button


func _ready():
	pass

func _pressed():
	$"../../..".get_node("ButtonConfirm").play()
	GlobalVariables.current_animation = "fade_out"
	GlobalVariables.next_scene = "res://Scenes/Statistics.tscn"
	$"../../..".add_child(GlobalVariables.transition.instance())
