extends Node2D


func _ready():
	translate_lang()
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	$Contents/Stars.text += (" " + str(GlobalVariables.stats["CollectedStars"]))
	$Contents/Coins.text += (" " + str(GlobalVariables.stats["CollectedCoins"]))
	$Contents/Spells.text += (" " + str(GlobalVariables.stats["CollectedSpells"]))
	$Contents/Deaths.text += (" " + str(GlobalVariables.stats["Deaths"]))
	$Contents/Rocks.text += (" " + str(GlobalVariables.stats["BrokenRocks"]))

func translate_lang():
	match GlobalVariables.language:
		"Spanish":
			$Title.text = "Estadisticas"
			$Title/TitleShadow.text = "Estadisticas"
			$Title.set_scale(Vector2(1.25, 1.5))
			$Contents.set_scale(Vector2(0.7, 0.75))
			$Contents/Stars.text = "Estrellas recogidas:"
			$Contents/Coins.text = "Monedas recogidas:"
			$Contents/Spells.text = "Hechizos recogidos:"
			$Contents/Deaths.text = "Muertes totales:"
			$Contents/Rocks.text = "Rocas destruidas:"
		"English":
			$Title.text = "Statistics"
			$Title/TitleShadow.text = "Statistics"
			$Title.set_scale(Vector2(1.5, 1.5))
			$Contents.set_scale(Vector2(0.75, 0.75))
			$Contents/Stars.text = "Collected stars:"
			$Contents/Coins.text = "Collected coins:"
			$Contents/Spells.text = "Collected spells:"
			$Contents/Deaths.text = "Total deaths:"
			$Contents/Rocks.text = "Broken Rocks:"
