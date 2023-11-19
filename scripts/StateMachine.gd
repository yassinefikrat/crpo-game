class_name StateMachine
extends Node

var current_state: State

func _ready():
	current_state = get_child(0)

func _physics_process(_delta):
	current_state.physics_process()

func initialize_with(state: State) -> void:
	current_state = state
	state.enter()

func transition(from: State, to: State) -> void:
	from.exit()
	current_state = to
	to.enter()
