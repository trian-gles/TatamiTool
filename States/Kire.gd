extends "res://States/BaseState.gd"


func button_release(b: String):
	if (b == "k"):
		window_finish("Finish");
