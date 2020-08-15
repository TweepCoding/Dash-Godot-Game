extends Node2D

var shopPage = 0
var direction = 0
var pricetext = "Price: "
var balancetext = "Gold: "
var buytext = "Buy"
var currenttext = "Current"
var usetext = "Use"

func _ready():
	translate_lang()
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	if (GlobalVariables.currentSkin != 0):
		$BuyUse.text = usetext
	else:
		$BuyUse.text = currenttext
	$Balance.text = balancetext + str(GlobalVariables.gold) + "$"

func turn_page(pages):
	if (pages > 0):
		$AnimationPlayer.play("Next")
	else:
		$AnimationPlayer.play("Back")
	direction = pages

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Next" || anim_name == "Back":
		var previousValue = shopPage
		shopPage = previousValue + direction
		if (not GlobalVariables.data.has(str(shopPage))):
			if (previousValue > shopPage):
				shopPage = int(GlobalVariables.data.keys().back())
			else:
				shopPage = 0
		$AnimatedSprite.animation = "id_" + str(shopPage)
		var currentStatus = buytext
		$Price.text = pricetext + str(GlobalVariables.data[str(shopPage)]["price"]) + "$"
		$BuyUse.set_position(Vector2(54, 410))
		if (int(GlobalVariables.currentSkin) == shopPage):
			currentStatus = currenttext
			$BuyUse.set_position(Vector2(54, 370))
			$Price.text = ""
		elif (GlobalVariables.data[str(shopPage)]["owned"]):
			currentStatus = usetext
			$Price.text = ""
			$BuyUse.set_position(Vector2(54, 370))
		$BuyUse.text = currentStatus
		if anim_name == "Next":
			$AnimationPlayer.play("Next-Ending")
		else:
			$AnimationPlayer.play("Back-Ending")

func translate_lang():
	match GlobalVariables.language:
		"Spanish":
			$ShopLabel.set_position(Vector2(40, 126))
			$LabelShadow.set_position(Vector2(44, 128))
			$Price.set_position(Vector2(52, 340))
			$Balance.set_position(Vector2(145, 515))
			pricetext = "Precio: "
			balancetext = "Oro: "
			buytext = "Comprar"
			usetext = "Usar"
			currenttext = "Usando"
			$ShopLabel.text = "Tienda"
			$LabelShadow.text = "Tienda"
		"English":
			$ShopLabel.set_position(Vector2(70, 125))
			$LabelShadow.set_position(Vector2(75, 126))
			$Price.set_position(Vector2(62, 340))
			$Balance.set_position(Vector2(115, 515))
			pricetext = "Price: "
			balancetext = "Gold: "
			buytext = "Buy"
			usetext = "Use"
			currenttext = "Current"
			$ShopLabel.text = "Shop"
			$LabelShadow.text = "Shop"
