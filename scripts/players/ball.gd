extends CharacterBody2D

@onready var sfx_paddle = $SfxPaddle
@onready var sfx_wall = $SfxWall

const ANGLE_MAX = PI / 4.0

var speed = 400.0
var direction = Vector2.ZERO
var hide_timer: float = 0.0
var is_hidden: bool = false
var _tween: Tween

func _ready():
	reset()
	hide_timer = randf_range(4.0, 9.0)

func _physics_process(delta: float):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		var normale = collision.get_normal()
		var collider = collision.get_collider()
		if "Player" in collider.name:
			var distance_y = global_position.y - collider.global_position.y
			var impact_relatif = clamp(distance_y / 50.0, -1.0, 1.0)
			var dir_x = 1.0 if collider.name == "Player1" else -1.0
			speed += 25.0
			sfx_paddle.pitch_scale = 1.0 + abs(impact_relatif) * 0.4
			sfx_paddle.play()
			direction = Vector2(dir_x, impact_relatif * sin(ANGLE_MAX)).normalized()
		elif direction.dot(normale) < 0:
			sfx_wall.play()
			direction = direction.bounce(normale)
		position += normale * (collision.get_depth() + 1.0)
	if direction != Vector2.ZERO:
		hide_timer -= delta
		if hide_timer <= 0:
			if is_hidden:
				_fade_in()
				is_hidden = false
				hide_timer = randf_range(4.0, 9.0)
			else:
				_fade_out()
				is_hidden = true
				hide_timer = randf_range(1.0, 2.0)

func reset():
	if _tween:
		_tween.kill()
	var screen_center = get_viewport().get_visible_rect().size / 2.0
	global_position = screen_center
	direction = Vector2.ZERO
	speed = 400.0
	$ColorRect.modulate.a = 1.0
	is_hidden = false
	hide_timer = randf_range(4.0, 9.0)

func launch():
	var dir_x = [-1, 1].pick_random()
	var dir_y = randf_range(-0.8, 0.8)
	direction = Vector2(dir_x, dir_y).normalized()

func _fade_out():
	if _tween:
		_tween.kill()
	_tween = create_tween()
	_tween.tween_property($ColorRect, "modulate:a", 0.0, 0.6)

func _fade_in():
	if _tween:
		_tween.kill()
	_tween = create_tween()
	_tween.tween_property($ColorRect, "modulate:a", 1.0, 0.6)
