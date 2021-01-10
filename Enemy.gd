extends Node2D

var target = null

var HP = 20 setget set_HP

onready var HP_Label = $HP_Label
onready var Animation_Player = $AnimationPlayer

signal Died
signal end_turn

func set_HP(new_HP):
	HP = new_HP
	HP_Label.text = str(HP) + "hp"
	


func attack(target) -> void:
	yield(get_tree().create_timer(0.4), "timeout")
	Animation_Player.play("Attack")
	self.target = target
	yield(Animation_Player, "animation_finished")
	self.target = null
	emit_signal("end_turn")

func take_damage(amount):
	self.HP -= amount
	if is_dead():
		emit_signal("Died")
		queue_free()
	else:
		Animation_Player.play("Shake")
func deal_damage():
	self.target.HP -= 4
	print("Deal_damage")

func is_dead():
	return HP <= 0






