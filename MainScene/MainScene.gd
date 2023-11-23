extends Control

@onready var curr_state: BaseState = $States/Tatami

var last_pressed : Dictionary = {}
var last_released : Dictionary = {}


var buttons = ["p", "k", "s", "h", "2", "8", "6", "4"]

var frame_count: int = 0

var running: bool = false


func reset():
	frame_count = 0
	running = true
	last_pressed = {}
	last_released = {}
	for state in $States.get_children():
		state.disconnect("state_finished", Callable(self, "finish_state"))
		state.connect("state_finished", Callable(self, "finish_state"))
		state.reset()
	curr_state = $States/Tatami
	

# Called when the node enters the scene tree for the first time.
func _ready():
	frame_count = 0
	running = true
	
	for state in $States.get_children():
		state.connect("state_finished", Callable(self, "finish_state"))
		state.reset()
	curr_state = $States/Tatami

func _physics_process(delta):
	frame_count += 1
	
	if Input.is_action_just_pressed("reset") or GlobalInput.is_action_just_pressed("reset"):
		reset()
		
	for button in buttons:
		if Input.is_action_just_pressed(button) or GlobalInput.is_action_just_pressed(button):
			last_pressed[button] = frame_count
			curr_state.button_press(button)
		elif Input.is_action_just_released(button) or GlobalInput.is_action_just_release(button):
			last_released[button] = frame_count
			curr_state.button_released(button)
	
	
func finish_state(next_state: String):
	curr_state = get_node("States/" + next_state)
	curr_state.enter_frame = frame_count
