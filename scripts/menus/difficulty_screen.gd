extends Node2D

@export var sfx_button: AudioStream
@onready var impossible_button = $ImpossibleButton

var click_count = 0

func _ready() -> void:
	pass

func _on_easy_button_pressed():
	GameManager.play_sfx(sfx_button)
	GameManager.difficulty = "easy"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_medium_button_pressed():
	GameManager.play_sfx(sfx_button)
	GameManager.difficulty = "medium"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_hard_button_pressed():
	GameManager.play_sfx(sfx_button)
	GameManager.difficulty = "hard"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_back_button_pressed():
	GameManager.play_sfx(sfx_button)
	get_tree().change_scene_to_file("res://scenes/menus/start_screen.tscn")

func _on_impossible_button_pressed():
	GameManager.play_sfx(sfx_button)
	GameManager.difficulty = "impossible"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_difficulty_title_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		GameManager.play_sfx(sfx_button)
		click_count += 1
		if click_count >= 10:
			impossible_button.visible = true
