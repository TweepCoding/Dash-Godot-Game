extends AnimatedSprite

signal spell(spell)

func _ready():
	randomize()
	var rand = randi()%2 + 1
	match rand:
		1:
			animation = "wind"
		2:
			animation = "fire"

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		emit_signal("spell",animation)
		get_parent().get_node("Player/Spell").play()
	queue_free()



func _on_Area2D_area_entered(_area):
	set_position(Vector2(rand_range(30,250), rand_range(100, 520)))
