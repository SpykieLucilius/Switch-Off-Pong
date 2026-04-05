extends CharacterBody2D

var speed = 400.0
var direction = Vector2.ZERO

func _ready():
	reset()
	
func _physics_process(delta: float):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		var normale = collision.get_normal()
		var collider = collision.get_collider()
		
		if "Player" in collider.name:
			var distance_y = global_position.y - collider.global_position.y
			
			var impact_relatif = clamp(distance_y / 50.0, -1.0, 1.0)
			var dir_x = 1.0 if collider.name == "Player1" else -1.0
			var angle_max = PI / 4.0
			direction = Vector2(dir_x, impact_relatif * sin(angle_max)).normalized()
			
		elif direction.dot(normale) < 0:
			direction = direction.bounce(normale)
			
		position += normale * (collision.get_depth() + 1.0)
func reset():
	var screen_center = get_viewport().get_visible_rect().size / 2.0
	global_position = screen_center  
	var dir_x = [-1, 1].pick_random()
	var dir_y = randf_range(-0.8, 0.8)
	direction = Vector2(dir_x, dir_y).normalized()
