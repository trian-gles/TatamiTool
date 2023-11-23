extends "res://States/BaseState.gd"


func button_press(b: String):
	if (b == "k" or b == "p" or b == "s"):
		if (owner.frame_count - enter_frame > 1):
			color.color = Color(255, 0, 0)
			label.text = "IAD ruined by button"
			print(b)
			emit_signal("state_finished", "KireTatami")
		
	if (b == "6"):
		var press_frame = owner.last_pressed.get("8")
		if press_frame and (owner.frame_count - press_frame) < 9:
			window_finish("KireTatami");
		else:
			color.color = Color(255, 0, 0)
			label.text = "IAD jump miss"
			emit_signal("state_finished", "KireTatami")
			
	if (b == "8"):
		var rel = owner.last_released.get("6")
		if (rel) and (owner.last_pressed.get("6") < rel):
			color.color = Color(255, 0, 0)
			label.text = "IAD vert jump"
			emit_signal("state_finished", "KireTatami")

func button_release(b: String):
	if (b == "k"):
		color.color = Color(255, 0, 0)
		label.text = "IAD neg edge"
		emit_signal("state_finished", "KireTatami")
