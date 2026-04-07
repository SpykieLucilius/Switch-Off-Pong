extends Node2D

var score_p1 = 0
var score_p2 = 0
var is_counting_down = false

@onready var label_p1 = $ScoreP1
@onready var label_p2 = $ScoreP2
@onready var victory_label = $VictoryLabel
@onready var replay_button = $ReplayButton
@onready var countdown_label = $CountdownLabel
@onready var ball = $Ball
@onready var sfx_goal = $SfxGoal
@onready var sfx_replay = $SfxReplay

func check_win() -> bool:
	if score_p1 >= 5:
		announce_winner("Player 1 Win !")
		return true
	elif score_p2 >= 5:
		announce_winner("Player 2 Win !")
		return true
	return false

func announce_winner(message):
	victory_label.text = message
	ball.direction = Vector2.ZERO
	ball.visible = false
	replay_button.show()
	
func _ready() -> void:
	start_countdown()

func _on_goal_left_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p2 += 1
		label_p2.text = str(score_p2)
		sfx_goal.play()
		body.reset()
		if not check_win():
			start_countdown()


func _on_goal_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p1 += 1
		label_p1.text = str(score_p1)
		sfx_goal.play()
		body.reset()
		if not check_win():
			start_countdown()

func _on_replay_button_pressed() -> void:
	sfx_replay.play()
	replay_button.hide()
	victory_label.text = ""
	
	score_p1 = 0
	score_p2 = 0
	label_p1.text = "0"
	label_p2.text = "0"
	
	ball.visible = true
	ball.reset()
	start_countdown()

func start_countdown():
	if is_counting_down:
		return
	is_counting_down = true
	countdown_label.visible = true
	for i in [3, 2, 1]:
		countdown_label.text = str(i)
		await get_tree().create_timer(1.0).timeout
	countdown_label.visible = false
	is_counting_down = false
	ball.launch()
