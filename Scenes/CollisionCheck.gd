extends Area2D

signal safe_area(location)


func _ready():
	pass


func _on_CollisionCheck_area_entered(_area):
	emit_signal("safe_area", null)
	position = Vector2(0, 0)
	$Timer.stop()


func _on_CollisionCheck_body_entered(_body):
	emit_signal("safe_area", null)
	position = Vector2(0, 0)
	$Timer.stop()


func _on_Timer_timeout():
	emit_signal("safe_area", position)
	position = Vector2(0, 0)
