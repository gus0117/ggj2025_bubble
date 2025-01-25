extends ProgressBar
class_name Pacientometro

@export var colorPaciente : Color
@export var colorNormal : Color
@export var colorImaciente: Color
@export var colorEnojado: Color
@export var styleBox: StyleBoxFlat

func updatePacientometro(value: float) -> void:
	self.value = value
	updateColor()

func updateColor() -> void:
	if value <= 0.3:
		#Color verde
		styleBox.bg_color = colorPaciente
		add_theme_stylebox_override("fill", styleBox)
	elif value > 0.3 and value < 0.7:
		#Color amarillo
		styleBox.bg_color = colorNormal
		add_theme_stylebox_override("fill", styleBox)
	elif value > 0.7 and value < 1.0:
		#Color naranja
		styleBox.bg_color = colorImaciente
		add_theme_stylebox_override("fill", styleBox)
	elif value == 1:
		#Color rojo
		styleBox.bg_color = colorEnojado
		add_theme_stylebox_override("fill", styleBox)
