extends StaticBody2D

@export var movement_speed: float = 480.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	
func _process(delta: float) -> void:
	var movement_direction = Input.get_axis("up", "down")
	position.y += movement_direction  * movement_speed * delta
	position.y = clamp(position.y, 57.5, get_viewport_rect().size.y - 57.5)
