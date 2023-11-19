extends State

func enter():
#	print("Entered IdleState.")
	$"../../IdleSpriteSheet".show()
	$"../../AnimationPlayer".play("idle")
#	$"../../AnimatedSprite2D".animation = "idle"
#	$"../../AnimatedSprite2D".play()

func exit():
	$"../../IdleSpriteSheet".hide()

func physics_process():
	if Input.is_action_just_pressed("ui_accept"):
		$"..".transition(self, $"../AttackState")
	elif Input.get_axis("ui_left", "ui_right"):
		$"..".transition(self, $"../RunningState")
