extends Node2D

const BattleUnits = preload("res://BattleUnits.tres")


export(int) var HP = 20 setget set_HP
export(int) var damage = 4

onready var HP_Label = $HP_Label
onready var Animation_Player = $AnimationPlayer

signal Died
signal end_turn

func set_HP(new_HP):
	HP = new_HP
	if HP_Label != null:
		HP_Label.text = str(HP) + "hp"
	


func attack() -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	Animation_Player.play("Attack")
	yield(Animation_Player, "animation_finished")
	emit_signal("end_turn")

func take_damage(amount):
	self.HP -= amount
	if is_dead():
		emit_signal("Died")
		queue_free()
	else:
		Animation_Player.play("Shake")
func deal_damage():
	BattleUnits.PlayerStats.HP -= damage


func is_dead():
	return HP <= 0



func _ready():
	BattleUnits.Enemy = self
	
func _exit_tree():
	BattleUnits.Enemy = null


