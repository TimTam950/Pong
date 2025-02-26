extends CharacterBody2D

@export var speed: float = 500.0

func _ready() -> void:
	velocity = Vector2(-speed, randf_range(-500, 500)).normalized() * speed


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	
