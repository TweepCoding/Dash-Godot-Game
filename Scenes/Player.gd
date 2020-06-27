extends KinematicBody2D

func _ready():
	pass

func on_death():
	$Sprite.animation = "death"
	$Death.play()
	$Sprite.play()

func on_spell(spell):
	if (spell == "wind"):
		get_parent().windDash = 1

func _on_Sprite_animation_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/GameOver.tscn")
