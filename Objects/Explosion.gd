extends AnimatedSprite


func _ready():
	pass

func _on_Area2D_area_entered(area):
	area.get_parent().queue_free()


func _on_Explosion_animation_finished():
	queue_free()
