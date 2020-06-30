extends AnimatedSprite


func _ready():
	pass

func _on_Area2D_area_entered(area):
	if area.name != "CollisionCheck":
		area.get_parent().queue_free()


func _on_Explosion_animation_finished():
	queue_free()
