extends Marker2D


var minion_scene = preload("res://scenes/Minion.tscn")


func _ready():
	spawn_minion()
	$Timer.start()


func _on_timer_timeout():
	spawn_minion()


func spawn_minion():
	var minion = minion_scene.instantiate()
	add_child(minion)
