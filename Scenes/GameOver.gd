extends Node2D

var pointstext

func _ready():
	translate_lang()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), false)
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	GlobalVariables.check_achievement()
	$Score.text = str(GlobalVariables.score) + pointstext
	if (GlobalVariables.score != GlobalVariables.highscore):
		$NewRecord.text = ""

func translate_lang():
	match GlobalVariables.language:
		"Spanish":
			$ScoreShowLabel.text = "Tu puntaje fue:"
			pointstext = " puntos"
			$NewRecord.text = "Nuevo mayor puntaje!"
			$Exit.text = "Volver al menu"
			$Exit.set_position(Vector2(25, 400))
		"English":
			$ScoreShowLabel.text = "Your Score was:"
			pointstext = " points"
			$NewRecord.text = "New Highscore!"
			$Exit.text = "Back to menu"
			$Exit.set_position(Vector2(35, 400))
