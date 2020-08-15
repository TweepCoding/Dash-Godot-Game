extends Button

func _ready():
	pass

func _pressed():
	if (self.text == "Use"):
		self.text = "Current"
		GlobalVariables.currentSkin = get_parent().shopPage
	elif (self.text == "Buy"):
		var intprice = GlobalVariables.data[get_parent().shopPage]["price"]
		if (GlobalVariables.gold >= intprice):
			$BuyUse.set_position(Vector2(54, 370))
			$Price.text = ""
			GlobalVariables.gold -= intprice
			GlobalVariables.data[get_parent().shopPage]["owned"] = true
			GlobalVariables.currentSkin = get_parent().shopPage
			self.text = "Current"
			get_parent().get_node("Balance").text = get_parent().balancetext + str(GlobalVariables.gold) + "$"

