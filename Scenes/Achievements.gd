extends Node2D

func _ready():
	translate_lang()
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	for x in GlobalVariables.achievements.keys():
		if (GlobalVariables.achievements[x]):
			var node = get_node("AchivementMainNode/ScrollContainer/Achievements/" + x)
			node.set_texture(GlobalVariables.complete_image_texture)

func translate_lang():
	match GlobalVariables.language:
		"Spanish":
			$AchivementMainNode/Title.text = "Logros"
			$AchivementMainNode/Title/TitleShadow.text = "Logros"
			$AchivementMainNode/ScrollContainer/Achievements/Stars/Label.text = "Obten 100\nestrellas"
			$AchivementMainNode/ScrollContainer/Achievements/Points/Label.text = "Obten 750\npuntos"
			$AchivementMainNode/ScrollContainer/Achievements/Coins/Label.text = "Recoje 50\nmonedas"
			$AchivementMainNode/ScrollContainer/Achievements/Rocks/Label.text = "Rompe 25\nrocas"
			$AchivementMainNode/ScrollContainer/Achievements/Spells/Label.text = "Usa 25\nhechizos"
			$AchivementMainNode/ScrollContainer/Achievements/All_Spells/Label.text = "Usa todos\nlos hechizos\na la vez"
			$AchivementMainNode/ScrollContainer/Achievements/Stars/Label.set_scale(Vector2(0.8, 0.8))
			$AchivementMainNode/ScrollContainer/Achievements/Points/Label.set_scale(Vector2(0.8, 0.8))
			$AchivementMainNode/ScrollContainer/Achievements/Coins/Label.set_scale(Vector2(0.8, 0.8))
			$AchivementMainNode/Title/TitleShadow.set_position(Vector2(76, 0))
			$AchivementMainNode/Title.set_position(Vector2(-50, 30))
			$AchivementMainNode/Title.set_scale(Vector2(1.5, 1.5))
		"English":
			$AchivementMainNode/Title.text = "Achievements"
			$AchivementMainNode/Title/TitleShadow.text = "Achievements"
			$AchivementMainNode/ScrollContainer/Achievements/Stars/Label.text = "Get 100\nestars"
			$AchivementMainNode/ScrollContainer/Achievements/Points/Label.text = "Get 750\npoints"
			$AchivementMainNode/ScrollContainer/Achievements/Coins/Label.text = "Collect\n50 coins"
			$AchivementMainNode/ScrollContainer/Achievements/Rocks/Label.text = "Break 25\nrocks"
			$AchivementMainNode/ScrollContainer/Achievements/Spells/Label.text = "Use 25\nSpells"
			$AchivementMainNode/ScrollContainer/Achievements/All_Spells/Label.text = "Usa all the\nspells at the\nsame time"
			$AchivementMainNode/ScrollContainer/Achievements/Stars/Label.set_scale(Vector2(1, 1))
			$AchivementMainNode/ScrollContainer/Achievements/Points/Label.set_scale(Vector2(1, 1))
			$AchivementMainNode/ScrollContainer/Achievements/Coins/Label.set_scale(Vector2(1, 1))
			$AchivementMainNode/Title/TitleShadow.set_position(Vector2(26, 0))
			$AchivementMainNode/Title/TitleShadow.set_scale(Vector2(1, 1))
