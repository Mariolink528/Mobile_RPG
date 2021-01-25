extends "res://ActionButton.gd"


func _on_pressed():
	var PlayerStats = BattleUnits.PlayerStats
	if PlayerStats != null:
		if PlayerStats.MP >= 8:
			PlayerStats.HP += 5
			PlayerStats.MP -= 8
			PlayerStats.AP -= 1
	
