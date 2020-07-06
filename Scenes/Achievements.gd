extends Node2D

func _ready():
	GlobalVariables.current_animation = "fade_in"
	add_child(GlobalVariables.transition.instance())
	for x in GlobalVariables.achievements.keys():
		if (GlobalVariables.achievements[x]):
			var node = get_node("AchivementMainNode/ScrollContainer/Achievements/" + x)
			node.set_texture(GlobalVariables.complete_image_texture)
			for y in node.get_children():
				y.queue_free()
