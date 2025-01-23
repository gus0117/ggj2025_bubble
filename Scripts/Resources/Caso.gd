extends Resource
class_name Caso

#region Personaje

@export var nombre: String
@export var edad: int
@export_range(0,1) var pacienciaActual: float

#endregion

#region Dialogo

@export var cuartada: String
@export var urlPrueba1: String #URL del icono
@export var urlPrueba2: String
@export var urlPrueba3: String
@export var esVerdad: bool

#endregion

#region Evidencia

@export var debil: String
@export var incompleta: String
@export var completa: String

#endregion
