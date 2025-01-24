extends Resource
class_name Caso

#region Caso
@export var titulo: String

#region Personaje

@export var nombre: String
@export var edad: int
@export_range(0,1) var pacienciaActual: float

#endregion

#region Dialogo

@export var cuartada: String

#region Prueba_1
@export var urlPrueba1: String #URL del icono
@export var p1_debil: String
@export var p1_incompleta: String
@export var p1_completa: String
#endregion Prueba_1

#region Prueba_2
@export var urlPrueba2: String
@export var p2_debil: String
@export var p2_incompleta: String
@export var p2_completa: String
#endregion Prueba_2

#region Prueba_3
@export var urlPrueba3: String
@export var p3_debil: String
@export var p3_incompleta: String
@export var p3_completa: String
#endregion Prueba_3

@export var esVerdad: bool

#endregion
