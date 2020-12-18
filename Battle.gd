extends Node

onready var BattleActionButtons = $UI/BattleActionButtons
onready var PlayerStats = $PlayerStats
func _on_Attack_Button_pressed():
	var Enemy = find_node("Enemy")
	if Enemy != null:
		Enemy.HP -= 4


func _on_Enemy_Died():
	BattleActionButtons.hide()	
