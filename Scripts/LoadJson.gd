extends Node

var saveCaseResourcePath:= "res://Resources/Casos/"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CaseResourceGenerator()


# Genera los Resources de casos desde un archivo JSON
# SOLO EJECUTAR UNA VEZ CUANDO SE ACTUALIZE LA BASE DE DATOS
# El archivo JSON se genera a partir de un excel completado
# por los diseñadores.
func CaseResourceGenerator()->void:
	#Se carga el archivo JSON en una variable string
	var json_string := FileAccess.get_file_as_string("res://Data/data.json")
	
	# Se crea una variable para convertir el texto a JSON
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		var data_received = json.data
		#print(data_received["casos"][0]["titulo"])
		if typeof(data_received["casos"]) == TYPE_ARRAY:
			for c in data_received["casos"]:
				var new_caso = Caso.new()
				new_caso.titulo = c.titulo
				new_caso.nombre = c.nombre_sospechoso
				new_caso.edad = c.edad
				new_caso.coartada = c.coartada
				new_caso.urlPrueba1 = c.url_prueba_1
				new_caso.p1_debil = c.p1_debil
				new_caso.p1_incompleta = c.p1_incompleta
				new_caso.p1_completa = c.p1_completa
				new_caso.urlPrueba2 = c.url_prueba_2
				new_caso.p2_debil = c.p2_debil
				new_caso.p2_incompleta = c.p2_incompleta
				new_caso.p2_completa = c.p2_completa
				new_caso.urlPrueba3 = c.url_prueba_3
				new_caso.p3_debil = c.p3_debil
				new_caso.p3_incompleta = c.p3_incompleta
				new_caso.p3_completa = c.p3_completa
				new_caso.esVerdad = false
				var save_result = ResourceSaver.save(new_caso, saveCaseResourcePath)
				if save_result != OK:
					print(save_result)
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())

	"""
	var new_resource = Resource.new()
	var save_result = ResourceSaver.save(new_resource, saveCaseResourcePath)
	if save_result != OK:
		print(save_result)
	"""
