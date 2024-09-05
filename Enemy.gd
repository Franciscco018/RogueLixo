extends CharacterBody2D

var speed = 150
var player_pos
var target_pos
@onready var player = get_parent().get_node("Robson")
@onready var lixo = preload("res://lixo.tscn")

func _physics_process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	z_index = 1
	if position.distance_to(player_pos) > 3:
		position += target_pos *  speed * delta
