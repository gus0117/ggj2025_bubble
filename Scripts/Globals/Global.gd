extends Node
class_name Global

var respuestaCasoActual: bool
var respuestaJugador: bool
var indiceCasos: int = 0

@export var db: CasosDB

func PasarSiguienteCaso() -> void:
	indiceCasos += 1
	if indiceCasos >= db.casos.size():
		indiceCasos = 0

func Reiniciar() -> void:
	indiceCasos = 0
