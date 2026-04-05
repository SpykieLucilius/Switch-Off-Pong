extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goal_left_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		body.position = get_viewport_rect().size / 2


func _on_goal_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		body.position = get_viewport_rect().size / 2
