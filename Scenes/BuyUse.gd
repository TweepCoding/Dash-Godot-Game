extends Button

func _ready():
	pass

func _pressed():
	if (self.text == "Use"):
		self.text = "Current"
		GlobalVariables.currentSkin = get_parent().shopPage
	elif (self.text == "Buy"):
		var intgold = int(GlobalVariables.gold)
		var intprice = int(GlobalVariables.data[get_parent().shopPage]["price"])
		if (intgold >= intprice):
			GlobalVariables.gold = str(intgold - intprice)
			GlobalVariables.data[get_parent().shopPage]["owned"] = true
			GlobalVariables.currentSkin = get_parent().shopPage
			self.text = "Current"
			GlobalVariables.save()
			get_parent().get_node("Balance").text = "Gold: " + GlobalVariables.gold + "$"

