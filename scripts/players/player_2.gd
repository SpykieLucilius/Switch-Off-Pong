extends CharacterBody2D

const SPEED = 400.0

var ai_speed = 340.0
var ai_error = 60.0
var ball: Node2D = null
var target_y: float = 0.0
var reaction_timer: float = 0.0
var reaction_interval: float = 0.2
var is_ai: bool = false

func _ready():
	is_ai = GameManager.game_mode == "ai"
	if is_ai:
		ball = get_node("/root/Main/Ball")
		target_y = global_position.y
		match GameManager.difficulty:
			"easy":
				reaction_interval = 0.4
				ai_speed = 350.0
				ai_error = 100.0
			"medium":
				reaction_interval = 0.2
				ai_speed = 400.0
				ai_error = 60.0
			"hard":
				reaction_interval = 0.05
				ai_speed = 475.0
				ai_error = 40.0

func _physics_process(delta):
	if is_ai:
		_ai_move(delta)
	else:
		var direction = Input.get_axis("p2_Up", "p2_Down")
		velocity.y = direction * SPEED
		move_and_slide()

func _ai_move(delta):
	if ball == null or ball.direction == Vector2.ZERO:
		return

	reaction_timer -= delta
	if reaction_timer <= 0:
		reaction_timer = reaction_interval
		if ball.is_hidden and ball.direction.x < 0:
			target_y = global_position.y + randf_range(-200.0, 200.0)
		else:
			target_y = ball.global_position.y + randf_range(-ai_error, ai_error)

	var diff = target_y - global_position.y
	if abs(diff) > 10:
		velocity.y = sign(diff) * ai_speed
	else:
		velocity.y = 0
	move_and_slide()

func reset():
	global_position.y = get_viewport().get_visible_rect().size.y / 2.0
