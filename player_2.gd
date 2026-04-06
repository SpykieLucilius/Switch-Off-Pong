extends CharacterBody2D

const SPEED = 400.0
const AI_SPEED = 340.0

var ball: Node2D = null
var target_y: float = 0.0
var reaction_timer: float = 0.0
var reaction_interval: float = 0.2

func _ready():
	if GameManager.game_mode == "ai":
		ball = get_node("/root/Main/Ball")
		target_y = global_position.y

func _physics_process(delta):
	if GameManager.game_mode == "ai":
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
		target_y = ball.global_position.y + randf_range(-60.0, 60.0)

	var diff = target_y - global_position.y
	if abs(diff) > 10:
		velocity.y = sign(diff) * AI_SPEED
	else:
		velocity.y = 0
	move_and_slide()
