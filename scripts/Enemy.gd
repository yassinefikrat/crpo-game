extends CharacterBody2D


var hit_points = 25


func _ready():
	$AnimationPlayer.play("idle")


func take_damage(damage: int) -> void:
	$IdleSpriteSheet.hide()
	$HitSpriteSheet.hide()
	
	hit_points -= damage
	
	if hit_points > 0:
		$HitSpriteSheet.show()
		$AnimationPlayer.play("hit")
	else:
		$DeathSpriteSheet.show()
		$AnimationPlayer.play("death")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "hit":
		$HitSpriteSheet.hide()
		$IdleSpriteSheet.show()
		$AnimationPlayer.play("idle")
	elif anim_name == "death":
		self.queue_free()
