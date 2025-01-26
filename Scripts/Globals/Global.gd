extends Node
class_name Global

signal on_reset_game # Esta señal se activa cuando se realizaron los todos casos

var respuestaCasoActual: bool
var respuestaJugador: bool
var indiceCasos: int = 1

@export var db: CasosDB

func PasarSiguienteCaso() -> void:
	indiceCasos += 1
	if indiceCasos >= db.casos.size():
		Reiniciar()

func Reiniciar() -> void:
	indiceCasos = 0
	db.casos[indiceCasos].pacienciaActual = 0
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Salir"):
		get_tree().quit()
