extends Button

signal change(scene)

func _ready():
	pass

func _pressed():
	emit_signal("change", "res://Scenes/MainGame.tscn")
