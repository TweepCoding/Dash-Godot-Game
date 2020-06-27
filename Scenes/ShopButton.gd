extends Button

func _ready():
	pass


func _pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/ShopScene.tscn")
