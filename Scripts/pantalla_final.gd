extends Control


func ChangeSceneToFinal() -> void:
	get_tree().change_scene_to_file("res://Scenes/pantalla_victoria_derrota.tscn")

func _on_no_option_pressed() -> void:
	GlobalParameters.respuestaJugador = false
	ChangeSceneToFinal()


func _on_si_option_pressed() -> void:
	GlobalParameters.respuestaJugador = true
	ChangeSceneToFinal()
