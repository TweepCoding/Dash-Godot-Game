extends ColorRect


func _enter_tree():
	$FadeAnimation.play(GlobalVariables.current_animation)

func _ready():
	pass


func _on_FadeAnimation_animation_finished(anim_name):
	if (anim_name == "fade_out"):
# warning-ignore:return_value_discarded
		get_tree().change_scene(GlobalVariables.next_scene)
	queue_free()
