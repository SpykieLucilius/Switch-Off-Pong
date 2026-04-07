extends Node2D

@export var sfx_button: AudioStream

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
