extends Node2D

func _ready():
	GlobalVariables.check_achievement()
	GlobalVariables.save()
	$Score.text = GlobalVariables.score + " points"
	if (GlobalVariables.score != GlobalVariables.highscore):
		$NewRecord.text = ""
