extends Node2D

func _ready():
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	GlobalVariables.check_achievement()
	GlobalVariables.save()
	$Score.text = GlobalVariables.score + " points"
	if (GlobalVariables.score != GlobalVariables.highscore):
		$NewRecord.text = ""
