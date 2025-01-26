extends Node2D
class_name GameController

#Scenes References
@onready var sprSospechoso: Sprite2D = $Sospechoso
@onready var gameui: GameUIController = $CanvasLayer/Game
@onready var timer_paciencia: Timer = $Sospechoso/TimerPaciencia
@onready var pacientometro: Pacientometro = $CanvasLayer/Indicador/Pacientometro
@onready var animation_player: AnimationPlayer = $Sospechoso/AnimationPlayer

#Variables
var casoActual : Caso

#default
var defaultSprite = preload("res://Assets/Sospechosos/default_char.png")

#Enums
enum Emotion {NORMAL, ANGRY, RELAX}

func _ready() -> void:
	if GlobalParameters.db != null:
		casoActual = GlobalParameters.db.casos[GlobalParameters.indiceCasos]
		GlobalParameters.respuestaCasoActual = casoActual.esVerdad
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
		
	#Animacion Nerviosa
	if casoActual.pacienciaActual > 0.7:
		#Color naranja
		animation_player.play("Temblar")
	else:
		if animation_player.is_playing():
			animation_player.stop()
	#Actualizacion visual
	pacientometro.updatePacientometro(casoActual.pacienciaActual)
	if casoActual.pacienciaActual >= 1:
		timer_paciencia.stop()
		#Desencadenar final
		FinishInterview()
	

func GetPacienceByAge(age: int, e: Emotion) -> float:
	var pacience: float = 0
	match e:
		Emotion.NORMAL:
			if age < 18:
				pacience = 0.3
			elif age >= 18 and age < 30:
				pacience = 0.2
			else:
				pacience = 0.1
		Emotion.ANGRY:
			if age < 18:
				pacience = 0.1
			elif age >= 18 and age < 30:
				pacience = 0.1
			else:
				pacience = 0.3
		Emotion.RELAX:
			if age < 18:
				pacience = 0.3
			elif age >= 18 and age < 30:
				pacience = 0.1
			else:
				pacience = 0
	return pacience

func FinishInterview() -> void:
	get_tree().change_scene_to_file("res://Scenes/pantalla_final.tscn")
	pass

func _on_timer_paciencia_timeout() -> void:
	UpdatePaciencia(0.1)

func _on_normal_bubble() -> void:
	var impatience = GetPacienceByAge(casoActual.edad, Emotion.NORMAL)
	UpdatePaciencia(-impatience) #disminuye la impaciencia

func _on_angry_bubble() -> void:
	var impatience = GetPacienceByAge(casoActual.edad, Emotion.ANGRY)
	UpdatePaciencia(-impatience) #disminuye la impaciencia

func _on_relax_bubble() -> void:
	var impatience = GetPacienceByAge(casoActual.edad, Emotion.RELAX)
	UpdatePaciencia(-impatience) #disminuye la impaciencia
