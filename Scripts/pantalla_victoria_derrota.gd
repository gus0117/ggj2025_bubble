extends Control
@onready var victoria: Control = $Victoria
@onready var derrota: Control = $Derrota


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GlobalParameters.respuestaCasoActual == GlobalParameters.respuestaJugador:
		#Mostrar victoria
		victoria.visible = true
	else:
		derrota.visible = true


func _on_sig_caso_pressed() -> void:
	GlobalParameters.PasarSiguienteCaso()
	get_tree().change_scene_to_file("res://Scenes/loading_screen.tscn")




func _on_volver_menu_pressed() -> void:
	GlobalParameters.Reiniciar()
	get_tree().change_scene_to_file("res://Scenes/menuback.tscn")
