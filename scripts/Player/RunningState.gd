extends State

const SPEED = 100.0

var screen_size

func _ready():
	screen_size = get_viewport().size

func enter():
#	print("Entered RunningState.")
	$"../../RunSpriteSheet".show()
	$"../../AnimationPlayer".play("run")
#	$"../../AnimatedSprite2D".animation = "run"
#	$"../../AnimatedSprite2D".play()

func exit():
	$"../../RunSpriteSheet".hide()

func physics_process():
	if Input.is_action_just_pressed("ui_accept"):
		$"..".transition(self, $"../AttackState")
	else:
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			$"../../IdleSpriteSheet".flip_h = direction < 0
			$"../../RunSpriteSheet".flip_h = direction < 0
			$"../../AttackSpriteSheet".flip_h = direction < 0
			$"../../AttackSpriteSheet/SwordHitBox".scale.x = direction
			$"../..".velocity.x = direction * SPEED
			$"../..".move_and_slide()
			$"../..".position.x = clamp($"../..".position.x, 0, screen_size.x)
			$"../..".position.y = clamp($"../..".position.y, 0, screen_size.y)
		else:
			$"..".transition(self, $"../IdleState")
