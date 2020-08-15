extends Node

var score = 0
var highscore = 0
var currentSkin = 0
var gold = 0
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
		"0":{"price":0, "owned":true},
		"1":{"price":20, "owned":false},
		"2":{"price":50, "owned":false},
		"3":{"price":50, "owned":false},
		"4":{"price":80, "owned":false},
		"5":{"price":100, "owned":false},
		"6":{"price":150, "owned":false},
		"7":{"price":250, "owned":false},
		"8":{"price":500, "owned":false}
}

var language = "English"

var spell_active = [false, false, false, false]

var music = [0, 0]

var current_animation = ""

var next_scene = ""

const complete_image_texture = preload("res://Images/achievements/achievement _finished.png")
const transition = preload("res://Objects/Transition.tscn")

func _ready():
	var file = File.new()
	if file.file_exists("user://save.dat"):
		file.open("user://save.dat", File.READ)
		var save = file.get_var()
		file.close()
		highscore = int(save["highscore"])
		currentSkin = int(save["currentSkin"])
		gold = int(save["gold"])
		data = data_bw_compatible(save["data"])
		if (save.has("achievements")):
			achievements = save["achievements"]
			stats = stats_bw_compatible(save["stats"])
		if (save.has("music")):
			music = save["music"]
		if (save.has("language")):
			language = save["language"]
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music[0])
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), music[1])

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST || what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		save()
		get_tree().quit()


# This is to fix old save files, which contained strings instead of integers. I'm an idiot.
func data_bw_compatible(data_to_be_cleaned):
	var dict = data_to_be_cleaned
	for key in dict.keys():
		dict[key]["price"] = int(dict[key]["price"])
	return dict

#Read above
func stats_bw_compatible(stats_to_be_cleaned):
	var dict = stats_to_be_cleaned
	for key in dict.keys():
		dict[key] = int(dict[key])
	return dict

func save():
	var file = File.new()
	file.open("user://save.dat", File.WRITE)
	var save = {
			"highscore": 0,
			"currentSkin": 0,
			"gold": 0,
			"data": {},
			"achievements": {},
			"stats": {},
			"music": [],
			"language": ""
	}
	save["highscore"] = highscore
	save["currentSkin"] = currentSkin
	save["gold"] = gold
	save["data"] = data
	save["achievements"] = achievements
	save["stats"] = stats
	save["music"] = music
	save["language"] = language
	file.store_var(save)
	file.close()
   
func check_achievement():
	achievements["Stars"] = achievements["Stars"] || int(stats["CollectedStars"]) > 99
	achievements["Points"] = achievements["Points"] || int(highscore) > 749
	achievements["Coins"] = achievements["Coins"] || int(stats["CollectedCoins"]) > 49
	achievements["Rocks"] = achievements["Rocks"] || int(stats["BrokenRocks"]) > 24
	achievements["Spells"] = achievements["Spells"] || int(stats["CollectedSpells"]) > 24
	achievements["All_Spells"] = achievements["All_Spells"] || spell_active.count(true) == 4
