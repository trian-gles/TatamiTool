extends "res://States/BaseState.gd"
	
func button_press(b: String):
	if b == "k":
		var down_rel = owner.last_released.get("2")
		if down_rel and (owner.frame_count - down_rel < 10):
			var forward = owner.last_pressed.get("6")
			if forward and (down_rel - forward < 10):
				color.color = green
				emit_signal("state_finished", "FRC")
			
