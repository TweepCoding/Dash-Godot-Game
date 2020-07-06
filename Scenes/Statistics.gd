extends Node2D


func _ready():
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	$Contents/Stars.text += (" " + str(GlobalVariables.stats["CollectedStars"]))
	$Contents/Coins.text += (" " + str(GlobalVariables.stats["CollectedCoins"]))
	$Contents/Spells.text += (" " + str(GlobalVariables.stats["CollectedSpells"]))
	$Contents/Deaths.text += (" " + str(GlobalVariables.stats["Deaths"]))
	$Contents/Rocks.text += (" " + str(GlobalVariables.stats["BrokenRocks"]))
