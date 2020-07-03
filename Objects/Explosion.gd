extends AnimatedSprite


func _ready():
	pass

func _on_Area2D_area_entered(area):
	if area.name == "Rock":
		GlobalVariables.stats["BrokenRocks"] = str(int(GlobalVariables.stats["BrokenRocks"]) + 1)
		GlobalVariables.check_achievement()
	if area.name != "CollisionCheck":
		area.get_parent().queue_free()


func _on_Explosion_animation_finished():
	queue_free()
