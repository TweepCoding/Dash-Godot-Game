extends AnimatedSprite

func _ready():
	play()

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		GlobalVariables.gold = str(int(GlobalVariables.gold) + 1)
		GlobalVariables.stats["CollectedCoins"] = str(int(GlobalVariables.stats["CollectedCoins"]) + 1)
		GlobalVariables.check_achievement()
		get_parent().get_node("Player/Coin").play()
	queue_free()
