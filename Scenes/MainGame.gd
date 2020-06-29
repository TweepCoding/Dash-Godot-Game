extends Node2D

var velocity = Vector2(0, 0)
var previous_velocity = Vector2(0, 0)
var number = 1
var enemy_chance = 0.9
var windDash = 0
var fireExplosion = false
const coin = preload("res://Objects/Coin.tscn")
const star = preload("res://Objects/Star.tscn")
const rock = preload("res://Objects/Rock.tscn")
const spell = preload("res://Objects/Spell.tscn")
const explosion = preload("res://Objects/Explosion.tscn")

func _ready():
	randomize()
	$HighScore.text = GlobalVariables.highscore
	$Player/Sprite.animation = "id_" + GlobalVariables.currentSkin

# warning-ignore:unused_argument
func _process(delta):
	number += 0.0001
	enemy_chance -= 0.000005
	if ($Player/Sprite.animation != "death"):
# warning-ignore:unused_variable
		var collision = $Player.move_and_collide(velocity)
	elif ($MusicPlayer.playing):
		$MusicPlayer.stop()
		GlobalVariables.score = $Score.text
		if (int($Score.text) > int(GlobalVariables.highscore)):
			GlobalVariables.highscore = $Score.text
	velocity *= 0.92
	if (velocity != Vector2(0, 0) && velocity.distance_to(previous_velocity) < 0.1):
		velocity = Vector2(0, 0)
	if (velocity == Vector2(0, 0) && fireExplosion):
		var kaboom = explosion.instance()
		kaboom.set_position($Player.get_position())
	if (velocity == Vector2(0, 0) && fireExplosion):
		fireExplosion = false
		var instance = explosion.instance()
		instance.set_position($Player.get_position())
		add_child(instance)
	previous_velocity = velocity

func _input(event):
	if event is InputEventMouseButton && event.is_pressed() && $Player/Sprite.animation != "death":
		if ($Score.text != "0"):
			$Score.text = str(int($Score.text) - 10)
		var vectorBetweenPoints = event.get_position() - $Player.get_position()
		velocity = vectorBetweenPoints.normalized() * (vectorBetweenPoints.length()/10)
		$Player.look_at(event.get_position())
		$Player.rotation_degrees += 90
		if (windDash == 1):
			windDash = 2
			$Player/Special.play()
		elif (windDash == 2):
			windDash = 0
		$Player/IdleDeath.start()
		if ($Player/IdleDeathWarning.time_left == 0):
			$Player/IdleDeathAnimation.stop()
			$Player/Sprite.animation = "id_" + GlobalVariables.currentSkin
		$Player/IdleDeathWarning.start()
		


func _on_TryToSpawn_timeout():
	if (rand_range(0,10) < number):
		var instance
		if (rand_range(0,1) > enemy_chance):
			instance = rock.instance()
			instance.connect("death", $Player, "on_death")
			instance.connect("score", self, "on_score_add")
		elif (rand_range(0,0.9) > 0.81):
			instance = coin.instance()
		elif (rand_range(0,0.81) > 0.7695):
			instance = spell.instance()
			instance.connect("spell", $Player, "on_spell")
		else:
			instance = star.instance()
			instance.connect("score", self, "on_score_add")
		instance.set_position(Vector2(
			rand_range(30,250), rand_range(100, 520)
		))
		add_child(instance)
	pass

func on_score_add(score_added):
	$Score.text = str(int($Score.text) + score_added)
