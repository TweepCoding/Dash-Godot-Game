extends Node2D

func _ready():
	GlobalVariables.save()
	$Score.text = GlobalVariables.score + " points"
	if (GlobalVariables.score != GlobalVariables.highscore):
		$NewRecord.text = ""

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST or what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		var file = File.new()
		file.open("user://save.dat", File.WRITE)
		var save = {
			"highscore": "0",
			"currentSkin": "0",
			"gold": "0",
			"data": {}
		}
		save["highscore"] = GlobalVariables.highscore
		save["currentSkin"] = GlobalVariables.currentSkin
		save["gold"] = GlobalVariables.gold
		save["data"] = GlobalVariables.data
		file.store_var(save)
		file.close()

