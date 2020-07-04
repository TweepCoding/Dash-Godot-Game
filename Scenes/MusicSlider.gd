extends HSlider


func _ready():
	pass


func _on_MusicSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)
	GlobalVariables.music[0] = value
