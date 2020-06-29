extends Node2D

func _ready():
	$GoldAmmountLabel.text = "Gold: " + GlobalVariables.gold + "$"
