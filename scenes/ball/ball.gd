extends CharacterBody2D

class_name Ball

@export var speed: float = 500.0

func _ready() -> void:
	print("ball ready")
	position = get_viewport_rect().size / 2
	velocity = Vector2(-speed, randf_range(-500, 500)).normalized() * speed


func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if velocity.x < 0:
			velocity.x -= 20.0
		else:
			velocity.x += 20.0
	
