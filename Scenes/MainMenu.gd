extends Node2D

var sceneChange = null

func _ready():
	pass


func _on_StartButton_change(scene):
	sceneChange = scene
	$Transition.visible = true
	$Transition/AnimationPlayer.play("fade_in")



func _on_AnimationPlayer_animation_finished(anim_name):
	if (anim_name == "fade_in"):
# warning-ignore:return_value_discarded
		get_tree().change_scene(sceneChange)
