extends "res://States/BaseState.gd"


var buttons = ["p", "k", "s"]


func button_press(b: String):
	var frames = []
	for button in buttons:
		var press_frame = owner.last_pressed.get(button)
		frames.push_back(press_frame)
		if press_frame and (owner.frame_count - press_frame) < 2:
			continue
		else:
			return
	print(frames)
	window_finish("IAD");
