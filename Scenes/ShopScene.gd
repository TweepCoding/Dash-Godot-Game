extends Node2D

var shopPage = "0"

func _ready():
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	if (GlobalVariables.currentSkin != "0"):
		$BuyUse.text = "Use"
	$Balance.text = "Gold: " + GlobalVariables.gold + "$"
func turn_page(direction):
	var previousValue = shopPage
	shopPage = str(int(previousValue) + direction)
	if (not GlobalVariables.data.has(shopPage)):
		if (previousValue > shopPage):
			shopPage = GlobalVariables.data.keys().back()
		else:
			shopPage = "0"
	$AnimatedSprite.animation = "id_" + shopPage
	$Price.text = "Price: " + GlobalVariables.data[shopPage]["price"] + "$"
	var currentStatus = "Buy"
	if (GlobalVariables.currentSkin == shopPage):
		currentStatus = "Current"
	elif (GlobalVariables.data[shopPage]["owned"]):
		currentStatus = "Use"
	$BuyUse.text = currentStatus
