extends Node2D
class_name GameController

@export var db: CasosDB

#Scenes References
@onready var sprSospechoso: Sprite2D = $Sospechoso
@onready var gameui: GameUIController = $CanvasLayer/Game
@onready var timer_paciencia: Timer = $Sospechoso/TimerPaciencia
@onready var pacientometro: Pacientometro = $CanvasLayer/Indicador/Pacientometro

#Variables
var casoActual : Caso
var casoIndice : int = 0

#default
var defaultSprite = preload("res://Assets/Sospechosos/default_char.png")

func _ready() -> void:
	if db != null:
		casoActual = db.casos[casoIndice]
		gameui.UpdateUI(casoActual)
		pacientometro.updatePacientometro(casoActual.pacienciaActual)
		updateCharacter()

# Actualiza la skin del personaje
func updateCharacter():
	var path = "res://Assets/Sospechosos/"+"default_char"+".png"
	sprSospechoso.texture = load(path)
	timer_paciencia.start()

func UpdatePaciencia(value: float) -> void:
	casoActual.pacienciaActual += value
	if casoActual.pacienciaActual < 0:
		casoActual.pacienciaActual = 0
	elif casoActual.pacienciaActual > 1:
		casoActual.pacienciaActual = 1
	#Actualizacion visual
	pacientometro.updatePacientometro(casoActual.pacienciaActual)
	


func _on_timer_paciencia_timeout() -> void:
	UpdatePaciencia(0.1)
	if casoActual.pacienciaActual >= 1:
		timer_paciencia.stop()
