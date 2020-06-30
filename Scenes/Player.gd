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
	elif (spell == "fire"):
		get_parent().fireExplosion = true
	elif (spell == "bounce"):
		get_parent().bounce = true
		$BouncePower.start()

func _on_Sprite_animation_finished():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/GameOver.tscn")


func _on_IdleDeath_timeout():
	on_death()
	$IdleDeathAnimation.stop()


func _on_IdleDeathWarning_timeout():
	$IdleDeathAnimation.start()


func _on_IdleDeathAnimation_timeout():
	if ($Sprite.animation != "predeath"):
		$Sprite.animation = "predeath"
	else:
		$Sprite.animation = "id_" + GlobalVariables.currentSkin


func _on_BouncePower_timeout():
	get_parent().bounce = false
