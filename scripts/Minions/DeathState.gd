extends State


func enter():
	$"../../DeathSpriteSheet".show()
	$"../../AnimationPlayer".play("death")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "death":
		$"../../DeathSpriteSheet".hide()
		$"../..".queue_free()
