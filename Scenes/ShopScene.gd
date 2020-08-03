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
	var currentStatus = "Buy"
	$Price.text = "Price: " + GlobalVariables.data[shopPage]["price"] + "$"
	$BuyUse.set_position(Vector2(54, 410))
	if (GlobalVariables.currentSkin == shopPage):
		currentStatus = "Current"
		$BuyUse.set_position(Vector2(54, 370))
		$Price.text = ""
	elif (GlobalVariables.data[shopPage]["owned"]):
		currentStatus = "Use"
		$Price.text = ""
		$BuyUse.set_position(Vector2(54, 370))
	$BuyUse.text = currentStatus
