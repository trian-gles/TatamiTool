extends Node

class_name BaseState

signal state_finished(next_state)

var enter_frame: int;
@export var window_start = 0
@export var window_end = 0

@onready var green = Color(0, 255, 0)

@onready var color = $Color
@onready var label = $Label


func button_press(b: String):
	pass
	
func button_released(b: String):
	pass
	
func reset():
	label.text = name
	color.color = Color(0, 0, 255)
	
func window_finish(next_state: String):
	var status
	var relative_frame = owner.frame_count - enter_frame
	if relative_frame < window_start:
		status = relative_frame - window_start
	elif relative_frame > window_end:
		status = relative_frame - window_end
	else:
		status = 0
		
	color.color = Color(255, 0, 0)
	if status < 0:
		label.text = name + " " + str(status)
	elif status > 0:
		label.text = name + " " + "+" + str(status)
	else:
		color.color = green
		label.text = name + " " + "Successful"
	
	emit_signal("state_finished", next_state)
