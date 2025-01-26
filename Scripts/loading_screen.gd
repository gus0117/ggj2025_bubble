extends Control

@onready var background: TextureRect = $background

func _ready() -> void:
	var path := "res://Assets/LoadingScreen/"+GlobalParameters.db.casos[GlobalParameters.indiceCasos].titulo+".png"
	background.texture = load(path)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_game.tscn")
