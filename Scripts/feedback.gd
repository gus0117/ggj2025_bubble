extends Control
class_name Feedback

@export var angry_emoji: String
@export var calm_emoji: String
@onready var content: Label = $content

func ShowAngry() -> void:
	content.text = angry_emoji
	Animate()

func ShowCalm() -> void:
	content.text = calm_emoji
	Animate()

func Animate() -> void:
	content.position = Vector2(-19, 0)
	content.modulate = Color(1,1,1,1)
	var tween := get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	tween.tween_property(content, "position", content.position - Vector2(0, 50), 0.8)
	tween.tween_property(content, "modulate", Color(1,1,1,0), 0.5)
