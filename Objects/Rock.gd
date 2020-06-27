extends Sprite

signal death()
signal score(add)

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "Player" && get_parent().windDash == 0):
		emit_signal("death")
	elif (body.name == "Player"):
		emit_signal("score",20)
		get_parent().get_node("Player/Break").play()
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
