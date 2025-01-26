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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
