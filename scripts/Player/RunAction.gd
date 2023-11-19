extends Node

const SPEED = 1.0

var screen_size

func _ready():
	screen_size = get_viewport().size

func execute(direction: float) -> void:
	print("RunAction executed.")
	$"../../AnimatedSprite2D".flip_h = direction < 0
	$"../..".velocity.x = direction * SPEED
	$"../..".move_and_slide()
	$"../..".position.x = clamp($"../..".position.x, 0, screen_size.x)
	$"../..".position.y = clamp($"../..".position.y, 0, screen_size.y)
