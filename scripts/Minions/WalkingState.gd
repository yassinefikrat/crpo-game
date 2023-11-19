extends State


const SPEED = 20


var screen_size


func _ready():
	screen_size = get_viewport().size


func enter():
	$"../../WalkingSpriteSheet".show()
	$"../../AnimationPlayer".play("walk")


func exit():
	$"../../WalkingSpriteSheet".hide()


func physics_process():
	$"../..".velocity.x = -SPEED
	$"../..".move_and_slide()
#	$"../..".position.x = clamp($"../..".position.x, 0, screen_size.x)
#	$"../..".position.y = clamp($"../..".position.y, 0, screen_size.y)
#	$"..".transition(self, $"../IdleState")
