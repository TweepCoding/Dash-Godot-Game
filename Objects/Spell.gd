extends AnimatedSprite

signal spell(spell)

func _enter_tree():
	randomize()
	var rand = randi()%4 + 1
	match rand:
		1:
			animation = "wind"
		2:
			animation = "fire"
		3:
			animation = "bounce"
		4:
			animation = "speed"
	play()

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		emit_signal("spell",animation)
		GlobalVariables.stats["CollectedSpells"] += 1
		GlobalVariables.check_achievement()
		get_parent().get_node("Player/Spell").play()
	queue_free()
