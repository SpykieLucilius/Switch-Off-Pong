extends Node2D

var score_p1 = 0
var score_p2 = 0

@onready var label_p1 = $ScoreP1
@onready var label_p2 = $ScoreP2
@onready var victory_label = $VictoryLabel
@onready var replay_button = $ReplayButton
@onready var countdown_label = $CountdownLabel

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
	$Ball.direction = Vector2.ZERO
	$Ball.visible = false
	replay_button.show()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_countdown()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_goal_left_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p2 += 1
		label_p2.text = str(score_p2)
		body.reset()
		if not check_win():
			start_countdown()


func _on_goal_right_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		score_p1 += 1
		label_p1.text = str(score_p1)
		body.reset()
		if not check_win():
			start_countdown()

func _on_replay_button_pressed() -> void:
	replay_button.hide()
	victory_label.text = ""
	
	score_p1 = 0
	score_p2 = 0
	label_p1.text = "0"
	label_p2.text = "0"
	
	$Ball.visible = true
	$Ball.reset()
	start_countdown()

func start_countdown():
	countdown_label.visible = true
	for i in [3, 2, 1]:
		countdown_label.text = str(i)
		await get_tree().create_timer(1.0).timeout
	countdown_label.visible = false
	$Ball.launch()
