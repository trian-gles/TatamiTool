extends "res://States/BaseState.gd"


func button_press(b: String):
	if (b == "6"):
		emit_signal("state_finished", "KireTatami")
		color.color = green
