extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the firs
func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
