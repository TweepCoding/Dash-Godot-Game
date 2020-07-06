extends AnimatedSprite

signal death()
signal score(add)

func _ready():
	play()

func _on_Area2D_body_entered(body):
	if (body.name == "Player" && get_parent().windDash == 0):
		emit_signal("death")
	elif (body.name == "Player"):
		emit_signal("score",20)
		GlobalVariables.stats["BrokenRocks"] = str(int(GlobalVariables.stats["BrokenRocks"]) + 1)
		GlobalVariables.check_achievement()
		get_parent().get_node("Player/Break").play()
	queue_free()
