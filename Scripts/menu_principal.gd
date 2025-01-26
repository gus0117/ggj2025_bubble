extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("MostrarTitulo")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")

func _on_settings_button_pressed() -> void:
	pass # Replace with function body.

func _on_exit_button_pressed() -> void:
	get_tree().quit()
