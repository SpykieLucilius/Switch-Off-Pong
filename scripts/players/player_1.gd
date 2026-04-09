extends CharacterBody2D

const SPEED = 400.0
var touch_target_y: float = -1.0
var scroll_dir: float = 0.0

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		touch_target_y = event.position.y
	elif event.is_action_pressed("p1_Up"):
		scroll_dir = -2.3
	elif event.is_action_pressed("p1_Down"):
		scroll_dir = 2.3

func _physics_process(_delta):
	var direction = Input.get_axis("p1_Up", "p1_Down")
	if direction == 0:
		direction = scroll_dir
	scroll_dir = 0.0

	if direction != 0:
		velocity.y = direction * SPEED
	elif touch_target_y >= 0:
		global_position.y = touch_target_y
		velocity.y = 0
	else:
		velocity.y = 0
	move_and_slide()

func reset():
	global_position.y = get_viewport().get_visible_rect().size.y / 2.0
