extends Node2D


func _ready():
	$Contents/Stars.text += (" " + str(GlobalVariables.stats["CollectedStars"]))
	$Contents/Coins.text += (" " + str(GlobalVariables.stats["CollectedCoins"]))
	$Contents/Spells.text += (" " + str(GlobalVariables.stats["CollectedSpells"]))
	$Contents/Deaths.text += (" " + str(GlobalVariables.stats["Deaths"]))
	$Contents/Rocks.text += (" " + str(GlobalVariables.stats["BrokenRocks"]))
