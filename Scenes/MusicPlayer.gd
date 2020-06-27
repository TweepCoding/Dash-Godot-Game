extends AudioStreamPlayer


func _ready():
	pass


func _on_MusicPlayer_finished():
	self.play()
