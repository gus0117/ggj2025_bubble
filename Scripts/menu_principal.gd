extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button

func _ready() -> void:
	if OS.get_name() == "Web":
		exit_button.visible = false
	
	animation_player.play("MostrarTitulo")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")

func _on_how_2_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/como_jugar.tscn")
	

func _on_exit_button_pressed() -> void:
	get_tree().quit()
