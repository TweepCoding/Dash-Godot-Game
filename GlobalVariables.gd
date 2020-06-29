extends Node

var score = "0"
var highscore = "0"
var currentSkin = "0"
var gold = "0"

var data = {
		"0":{"price":"0", "owned":true},
		"1":{"price":"20", "owned":false},
		"2":{"price":"50", "owned":false},
		"3":{"price":"50", "owned":false},
		"4":{"price":"80", "owned":false},
		"5":{"price":"100", "owned":false},
		"6":{"price":"150", "owned":false},
		"7":{"price":"250", "owned":false},
		"8":{"price":"500", "owned":false}
}

func _ready():
	var file = File.new()
	if file.file_exists("user://save.dat"):
		file.open("user://save.dat", File.READ)
		var save = file.get_var()
		file.close()
		highscore = save["highscore"]
		currentSkin = save["currentSkin"]
		gold = save["gold"]
		data = save["data"]

func save():
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
