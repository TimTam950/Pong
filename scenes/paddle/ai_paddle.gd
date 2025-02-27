extends StaticBody2D

@export var paddle_speed: float = 250.0
var viewport_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var ball = get_tree().get_first_node_in_group("ball")
	if ball:
		if ball.position.x < viewport_size.x / 2:
			return
		
		if ball.position.y > self.position.y:
			position.y += paddle_speed * delta
		elif ball.position.y < self.position.y:
			position.y -= paddle_speed * delta
		else:
			pass
			
		position.y = clampf(position.y, 57.5, viewport_size.y - 57.5)
		
	
