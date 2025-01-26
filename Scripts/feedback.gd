extends Control
class_name Feedback

@export var angry_emoji: Texture2D
@export var calm_emoji: Texture2D
@onready var content: TextureRect = $content

func ShowAngry() -> void:
	content.texture = angry_emoji
	Animate()

func ShowCalm() -> void:
	content.texture = calm_emoji
	Animate()

func Animate() -> void:
	content.position = Vector2(-14, 0)
	content.modulate = Color(1,1,1,1)
	var tween := get_tree().create_tween().bind_node(self).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_OUT)
	tween.tween_property(content, "position", content.position - Vector2(0, 50), 0.8)
	tween.tween_property(content, "modulate", Color(1,1,1,0), 0.5)
