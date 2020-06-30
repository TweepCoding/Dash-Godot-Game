extends AnimatedSprite

signal spell(spell)

func _ready():
	pass

func _enter_tree():
	randomize()
	var rand = randi()%3 + 1
	match rand:
		1:
			animation = "wind"
		2:
			animation = "fire"
		3:
			animation = "bounce"

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		emit_signal("spell",animation)
		get_parent().get_node("Player/Spell").play()
	queue_free()
