extends CharacterBody2D

const SPEED = 400.0

func _physics_process(_delta):
	var direction = Input.get_axis("p1_Up", "p1_Down")
	if direction != 0:
		velocity.y = direction * SPEED
		move_and_slide()
	else:
		velocity.y = 0

func reset():
	global_position.y = get_viewport().get_visible_rect().size.y / 2.0