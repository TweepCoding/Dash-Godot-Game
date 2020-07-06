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
		GlobalVariables.spell_active[0] = true
	elif (spell == "fire"):
		get_parent().fireExplosion = true
		GlobalVariables.spell_active[1] = true
	elif (spell == "bounce"):
		get_parent().bounce = true
		$BouncePower.start()
		GlobalVariables.spell_active[2] = true
	elif (spell == "speed"):
		get_parent().bounce = true
		get_parent().windDash = 2
		get_parent().velocity = get_parent().velocity.normalized() * 1750
		get_parent().velocity.x *= 1.25
		get_parent().friction = 0.99
		get_parent().bounce_back = 1.08
		$SpeedPower.start()
		GlobalVariables.spell_active[3] = true

func _on_Sprite_animation_finished():
	GlobalVariables.current_animation = "fade_out"
	GlobalVariables.next_scene = "res://Scenes/GameOver.tscn"
	get_parent().add_child(GlobalVariables.transition.instance())


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
	GlobalVariables.spell_active[2] = false


func _on_SpeedPower_timeout():
	if ($BouncePower.is_stopped()):
		get_parent().bounce = false
	get_parent().friction = 0.92
	get_parent().bounce_back = 1.2
	GlobalVariables.spell_active[3] = false
