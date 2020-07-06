extends Node2D

func _ready():
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	$MainNode/Music/MusicSlider.value = GlobalVariables.music[0]
	$MainNode/Music/SFXSlider.value = GlobalVariables.music[1]
