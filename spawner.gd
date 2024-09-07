extends Node2D

@onready var enemy = preload("res://enemy.tscn")
@onready var trash = preload("res://lixo.tscn")
@onready var lata = preload("res://lata_lixo.tscn")
@onready var xix = preload("res://xix.tscn")

func _on_timer_timeout():
	var Tpos_x = randi_range(-200,200)
	var Tpos_y = randi_range(-200,200)
	var Lpos_x = randi_range(-200,200)
	var Lpos_y = randi_range(-200,200)
	var pos_xEne = randi_range(-200,200)
	var pos_yEne = randi_range(-200,200)
	
	var Toffset = Vector2(Tpos_x,Tpos_y)
	var Loffset = Vector2(Lpos_x,Lpos_y)
	var offsetEne = Vector2(pos_xEne,pos_yEne)
	var xixx = xix.instantiate()
	xixx.position = position + offsetEne
	get_parent().get_node("EnemyHandler").add_child(xixx)
	
	var lixo = trash.instantiate()
	var lixoL = lata.instantiate()
	lixo.position = global_position + Toffset
	lixoL.position = global_position + Loffset
	get_parent().get_node(".").add_child(lixo)
	get_parent().get_node(".").add_child(lixoL)
