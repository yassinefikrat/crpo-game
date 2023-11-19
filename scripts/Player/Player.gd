extends CharacterBody2D


var state_machine: StateMachine = null


func _ready():
	state_machine = $"StateMachine"
	state_machine.initialize_with($"StateMachine/IdleState")


func _on_sword_hit_box_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(1)
