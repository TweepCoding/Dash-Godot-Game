extends Sprite

signal score(add)

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "Player"):
		emit_signal("score",20)
		get_parent().get_node("Player/Star").play()
	queue_free()


func _on_Area2D_area_entered():
	set_position(Vector2(rand_range(30,250), rand_range(100, 520)))