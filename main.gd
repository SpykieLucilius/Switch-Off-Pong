extends Node2D

var score_p1 = 0
var score_p2 = 0

@onready var label_p1 = $ScoreP1
@onready var label_p2 = $ScoreP2
@onready var victory_label = $VictoryLabel
@onready var replay_button = $ReplayButton

func check_win():
	if score_p1 >= 5:
		announce_winner("Player 1 Win !")
	elif score_p2 >= 5:
		announce_winner("Player 2 Win !")

func announce_winner(message):
	victory_label.text = message
	$Ball.direction = Vector2.ZERO
	$Ball.visible = false
	replay_button.show()
	
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
		check_win()


func _on_goal_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p1 += 1
		label_p1.text = str(score_p1)
		body.reset()
		check_win()


func _on_replay_button_pressed() -> void:
	replay_button.hide()
	victory_label.text = ""
	
	score_p1 = 0
	score_p2 = 0
	label_p1.text = "0"
	label_p2.text = "0"
	
	$Ball.visible = true
	$Ball.reset()
