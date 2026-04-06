extends Node2D

func _on_multiplayer_button_pressed():
	GameManager.game_mode = "multiplayer"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")

func _on_ai_button_pressed():
	GameManager.game_mode = "ai"
	get_tree().change_scene_to_file("res://scenes/menus/main.tscn")
