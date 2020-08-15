extends Node2D

var sceneChange = null
const english_flag = preload("res://Images/mainMenu/flags/english.png")
const spanish_flag = preload("res://Images/mainMenu/flags/spanish.png")

func _ready():
	translate_lang()
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())

func _on_StartButton_change(scene):
	$ButtonConfirm.play()
	GlobalVariables.current_animation = "fade_out"
	GlobalVariables.next_scene = scene
	add_child(GlobalVariables.transition.instance())

func translate_lang():
	update_language_icon()
	match GlobalVariables.language:
		"Spanish":
			$Buttons/StartButton.text = "Jugar"
			$Buttons/ShopButton.text = "Tienda"
			$Buttons/MoreButton.text = "Logros"
		"English":
			$Buttons/StartButton.text = "Play"
			$Buttons/ShopButton.text = "Shop"
			$Buttons/MoreButton.text = "Achievements"

func turn_into_language_id(language):
	match language:
		"English":
			return 0
		"Spanish":
			return 1

func turn_into_language(id):
	match id:
		0:
			return "English"
		1:
			return "Spanish"
		_:
			return "English"


func _on_Language_pressed():
	var current_lang = turn_into_language_id(GlobalVariables.language)
	GlobalVariables.language = turn_into_language(current_lang + 1)
	update_language_icon()
	translate_lang()

func update_language_icon():
	match GlobalVariables.language:
		"English":
			$Language.icon = english_flag
		"Spanish":
			$Language.icon = spanish_flag
