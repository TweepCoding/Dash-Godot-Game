extends Node2D

func _ready():
	$MainNode/Music/MusicSlider.value = GlobalVariables.music[0]
	$MainNode/Music/SFXSlider.value = GlobalVariables.music[1]
