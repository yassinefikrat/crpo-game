extends State


func enter():
	print("hit state enter")
	$"../../HitSpriteSheet".show()
	$"../../AnimationPlayer".play("hit")
	$"../../AnimationPlayer".seek(0)


func exit():
	print("hit state exit")
	$"../../HitSpriteSheet".hide()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hit":
		$"..".transition(self, $"../WalkingState")
