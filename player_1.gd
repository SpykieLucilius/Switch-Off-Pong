extends CharacterBody2D

const SPEED = 400.0

func _physics_process(delta):
	var direction = Input.get_axis("p1_Up", "p1_Down")
	velocity.y = direction * SPEED
	move_and_slide()
