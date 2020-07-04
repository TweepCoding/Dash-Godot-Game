extends HSlider


func _ready():
	pass

func _on_SFXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	GlobalVariables.music[1] = value
