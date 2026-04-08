extends Node2D

@onready var sfx_slider = $SfxSoundSlider
@export var sfx_player: AudioStream

func _ready():
	sfx_slider.min_value = 0.0
	sfx_slider.max_value = 1.0
	sfx_slider.step = 0.01
	sfx_slider.value = GameManager.sfx_volume

func _on_sfx_sound_slider_value_changed(value: float):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(value))
	GameManager.sfx_volume = value

func _on_sfx_sound_slider_drag_ended(_value_changed: bool):
	GameManager.play_sfx(sfx_player)

func _on_back_button_pressed():
	GameManager.play_sfx(sfx_player)
	get_tree().change_scene_to_file("res://scenes/menus/start_screen.tscn")
