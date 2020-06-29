extends Sprite

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		GlobalVariables.gold = str(int(GlobalVariables.gold) + 1)
		get_parent().get_node("Player/Coin").play()
	queue_free()


func _on_Area2D_area_entered(_area):
	set_position(Vector2(rand_range(30,250), rand_range(100, 520)))
