extends Node

const BattleUnits = preload("res://BattleUnits.tres")

var max_HP = 25 
var HP = max_HP setget set_HP
var max_AP = 3
var AP = max_AP setget set_AP
var max_MP = 10
var MP = max_MP setget set_MP

signal HP_Changed(value)
signal AP_Changed(value)
signal MP_Changed(value)

signal end_turn

func set_HP(value):
	HP = clamp(value, 0, max_HP)
	emit_signal("HP_Changed", HP)

func set_AP(value):
	AP = clamp(value, 0, max_AP)
	emit_signal("AP_Changed", AP)
	if AP == 0:
		emit_signal("end_turn")

func set_MP(value):
	MP = clamp(value, 0, max_MP)
	emit_signal("MP_Changed", MP)

func _ready():
	BattleUnits.PlayerStats = self
	
func _exit_tree():
	BattleUnits.PlayerStats = null
