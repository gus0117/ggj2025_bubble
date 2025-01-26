extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("MostrarTitulo")

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")

func _on_how_2_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/como_jugar.tscn")
	

func _on_exit_button_pressed() -> void:
	get_tree().quit()
