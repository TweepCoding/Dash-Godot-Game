extends Button


func _ready():
	pass

func _pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("https://tweep.dev/dash")
	$"../../..".get_node("ButtonConfirm").play()
