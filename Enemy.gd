extends CharacterBody2D

var speed = 150
var player_pos
var target_pos
var vidaE = 2
var knock = false
@onready var player = get_parent().get_parent().get_node("Robson")
@onready var lixo = preload("res://lixo.tscn")

func _physics_process(delta):
	player_pos = player.position
	target_pos = (player_pos - position).normalized()
	z_index = 1
	if position.distance_to(player_pos) > 3 and !knock:
		position += target_pos *  speed * delta
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("arma"):
		vidaE -=1
		#$AudioStreamPlayer.play()
		if vidaE == 0:
			queue_free()
	knock = true
	await(get_tree().create_timer(0.1).timeout)
	knock = false
