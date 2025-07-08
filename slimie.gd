extends CharacterBody2D

@warning_ignore("unused_parameter")

var health = 3
@onready var player = get_node("/root/Game/Player") 

func _ready():
	%Slime.play_walk()

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 200.0
	move_and_slide()

func take_damage():
	%Slime.play_hurt()
	health -= 1
	
	if health == 0:
		queue_free()
		const SMOKE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke_explosion = SMOKE.instantiate()
		get_parent().add_child(smoke_explosion)
		smoke_explosion.global_position = global_position
 
