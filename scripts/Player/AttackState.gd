extends State


func enter():
#	print("Entered AttackState.")
	$"../../AttackSpriteSheet".show()
	$"../../AnimationPlayer".play("attack")


func exit():
	$"../../AttackSpriteSheet".hide()


func _on_animation_player_animation_finished(_anim_name):
	$"..".transition(self, $"../IdleState")
