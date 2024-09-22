extends Node2D

@onready var enemy = preload("res://enemy.tscn")
@onready var trash = preload("res://lixo.tscn")
@onready var lata = preload("res://lata_lixo.tscn")
@onready var xix = preload("res://xix.tscn")
@onready var xix2 = preload("res://xix2.tscn")

func _on_timer_timeout():
	var Tpos_x = randi_range(0,2000)
	var Tpos_y = randi_range(0,2000)
	var Lpos_x = randi_range(0,2000)
	var Lpos_y = randi_range(0,2000)
	var pos_xEne = randi_range(0,2000)
	var pos_yEne = randi_range(0,2000)
	var pos_xEne2 = randi_range(0,2000)
	var pos_yEne2 = randi_range(0,2000)
	
	var Toffset = Vector2(Tpos_x,Tpos_y)
	var Loffset = Vector2(Lpos_x,Lpos_y)
	var offsetEne = Vector2(pos_xEne,pos_yEne)
	var offsetEne2 = Vector2(pos_xEne2,pos_yEne2)
	
	var xixx = xix.instantiate()
	xixx.position = position + offsetEne
	get_parent().get_node("EnemyHandler").add_child(xixx)
	
	var xixx2 = xix2.instantiate()
	xixx2.position = position + offsetEne2
	get_parent().get_node("EnemyHandler").add_child(xixx2)
	
	var lixo = trash.instantiate()
	var lixoL = lata.instantiate()
	lixo.position = global_position + Toffset
	lixoL.position = global_position + Loffset
	get_parent().get_node(".").add_child(lixo)
	get_parent().get_node(".").add_child(lixoL)
