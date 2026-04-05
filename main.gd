extends Node2D

var score_p1 = 0
var score_p2 = 0

@onready var label_p1 = $ScoreP1
@onready var label_p2 = $ScoreP2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goal_left_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p2 += 1
		label_p2.text = str(score_p2)
		body.reset()


func _on_goal_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p1 += 1
		label_p1.text = str(score_p1)
		body.reset()
