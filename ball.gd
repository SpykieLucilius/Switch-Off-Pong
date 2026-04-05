extends CharacterBody2D

var speed = 400.0
var direction = Vector2(1, 1).normalized()

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())
