extends "res://States/BaseState.gd"


func button_released(b: String):
	if (b == "k"):
		window_finish("Finish");
