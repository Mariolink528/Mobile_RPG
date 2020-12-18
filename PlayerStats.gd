extends Node


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
	HP = min(value, max_HP)
	emit_signal("HP_Changed", HP)

func set_AP(value):
	AP = min(value, max_AP)
	emit_signal("AP_Changed", AP)

func set_MP(value):
	MP = min(value, max_MP)
	emit_signal("MP_Changed", MP)
