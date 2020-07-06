extends Node2D

var sceneChange = null

func _ready():
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())

func _on_StartButton_change(scene):
	$ButtonConfirm.play()
	GlobalVariables.current_animation = "fade_out"
	GlobalVariables.next_scene = scene
	add_child(GlobalVariables.transition.instance())
