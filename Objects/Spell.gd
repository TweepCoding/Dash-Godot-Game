extends Sprite

signal spell(spell)

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		emit_signal("spell","wind")
		get_parent().get_node("Player/Spell").play()
	queue_free()



func _on_Area2D_area_entered():
	set_position(Vector2(rand_range(30,250), rand_range(100, 520)))
