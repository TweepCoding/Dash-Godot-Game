extends Sprite

signal score(add)

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		emit_signal("score",20)
		GlobalVariables.stats["CollectedStars"] = str(int(GlobalVariables.stats["CollectedStars"]) + 1)
		GlobalVariables.check_achievement()
		get_parent().get_node("Player/Star").play()
	queue_free()
