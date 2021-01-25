extends Node

const BattleUnits = preload("res://BattleUnits.tres")

onready var BattleActionButtons = $UI/BattleActionButtons

func _ready():
	start_player_turn()


func start_enemy_turn():
	BattleActionButtons.hide()
	var Enemy = BattleUnits.Enemy
	if Enemy != null:
		Enemy.attack()
		yield(Enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	BattleActionButtons.show()
	var PlayerStats = BattleUnits.PlayerStats
	PlayerStats.AP = PlayerStats.max_AP
	yield(PlayerStats, "end_turn")
	start_enemy_turn()

func _on_Enemy_Died():
	BattleActionButtons.hide()	
