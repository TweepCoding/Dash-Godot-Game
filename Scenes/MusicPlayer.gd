extends AudioStreamPlayer

func _ready():
	pass


func _on_MusicPlayer_finished():
	get_parent().play_random()