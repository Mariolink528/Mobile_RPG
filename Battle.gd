extends Node

const BattleUnits = preload("res://BattleUnits.tres")

export(Array, PackedScene) var Enemies = []

onready var animationPlayer = $AnimationPlayer
onready var BattleActionButtons = $UI/BattleActionButtons
onready var NextRoomButton = $UI/CenterContainer/NextRoomButton
onready var EnemyPosition = $EnemyPosition

func _ready():
	start_player_turn()
	var Enemy = BattleUnits.Enemy
	if Enemy != null:
		Enemy.connect("Died", self, "_on_Enemy_died")


func start_enemy_turn():
	BattleActionButtons.hide()
	var Enemy = BattleUnits.Enemy
	if Enemy != null and not Enemy.is_queued_for_deletion():
		Enemy.attack()
		yield(Enemy, "end_turn")
	start_player_turn()

func start_player_turn():
	BattleActionButtons.show()
	var PlayerStats = BattleUnits.PlayerStats
	PlayerStats.AP = PlayerStats.max_AP
	yield(PlayerStats, "end_turn")
	start_enemy_turn()

func _on_Enemy_died():
	NextRoomButton.show()
	BattleActionButtons.hide()
	

func create_new_enemy():
	Enemies.shuffle()
	var Enemy = Enemies.front()
	var enemy = Enemy.instance()
	EnemyPosition.add_child(enemy)
	enemy.connect("Died", self, "on_Enemy_died")

func _on_NextRoomButton_pressed():
	var PlayerStats = BattleUnits.PlayerStats
	NextRoomButton.hide()
	animationPlayer.play("FadeToNewRoom")
	yield(animationPlayer, "animation_finished")
	create_new_enemy()
	PlayerStats.AP = PlayerStats.max_AP
	BattleActionButtons.show()
