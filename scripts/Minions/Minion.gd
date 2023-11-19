extends CharacterBody2D


var hit_points = 3
var state_machine: StateMachine = null


func _ready():
	state_machine = $"StateMachine"
	state_machine.initialize_with($"StateMachine/WalkingState")
	$HealthBar.max_value = hit_points
	$HealthBar.value = hit_points


func take_damage(damage: int) -> void:
	hit_points -= damage

	if hit_points > 0:
		state_machine.transition(
			state_machine.current_state,
			$StateMachine/HitState,
		)
		$HealthBar.value = hit_points
	else:
		state_machine.transition(
			state_machine.current_state,
			$StateMachine/DeathState,
		)
		$HealthBar.value = 0
