extends Node2D


var HP = 20 setget set_HP

onready var HP_Label = $HP_Label
onready var Animation_Player = $AnimationPlayer

signal Died

func set_HP(new_HP):
	HP = new_HP
	HP_Label.text = str(HP) + "hp"
	if HP <= 0:
		queue_free()
		emit_signal("Died")
	else:
		Animation_Player.play("Shake")
		yield(Animation_Player, "animation_finished")
		Animation_Player.play("Attack")
		yield(Animation_Player, "animation_finished")
		var Battle = get_tree().current_scene
		var Player = Battle.find_node("PlayerStats")
		Player.HP -= 3
