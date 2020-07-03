extends Node

var score = "0"
var highscore = "0"
var currentSkin = "0"
var gold = "0"
var achievements = {
	"Stars":false,
	"Points":false,
	"Coins":false,
	"Rocks":false,
	"Spells":false,
	"All_Spells":false
}

var stats = {
	"CollectedStars":0,
	"CollectedCoins":0,
	"BrokenRocks":0,
	"CollectedSpells":0,
	"Deaths":0
}

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

var spell_active = [false, false, false]

var complete_image_texture = preload("res://Images/achievements/achievement _finished.png")

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
		if (save.has("achievements")):
			achievements = save["achievements"]
			stats = save["stats"]
func save():
	var file = File.new()
	file.open("user://save.dat", File.WRITE)
	var save = {
			"highscore": "0",
			"currentSkin": "0",
			"gold": "0",
			"data": {},
			"achievements": {},
			"stats": {}
	}
	save["highscore"] = highscore
	save["currentSkin"] = currentSkin
	save["gold"] = gold
	save["data"] = data
	save["achievements"] = achievements
	save["stats"] = stats
	file.store_var(save)
	file.close()
   
func check_achievement():
	achievements["Stars"] = achievements["Stars"] || int(stats["CollectedStars"]) > 49
	achievements["Points"] = achievements["Points"] || int(highscore) > 499
	achievements["Coins"] = achievements["Coins"] || int(stats["CollectedCoins"]) > 49
	achievements["Rocks"] = achievements["Rocks"] || int(stats["BrokenRocks"]) > 19
	achievements["Spells"] = achievements["Spells"] || int(stats["CollectedSpells"]) > 24
	achievements["All_Spells"] = achievements["All_Spells"] || spell_active.count(true) == 3
