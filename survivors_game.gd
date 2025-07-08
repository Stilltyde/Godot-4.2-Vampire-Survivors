extends Node2D

func spawn_mob():
	var mob = preload("res://slimie.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	mob.global_position = %PathFollow2D.global_position
	add_child(mob)
	
func _on_mob_spawn_timer_timeout() -> void:
	spawn_mob()
