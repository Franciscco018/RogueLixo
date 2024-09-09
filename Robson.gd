extends CharacterBody2D

@onready var lixo = preload("res://lixo.tscn")
@onready var voltar = $"../CanvasLayer/Control/ColorRect/VBoxContainer/Voltar"

var knock = false
var jogador_detectado = false
var coletado = false
var enemy_morreu = false

var vida = 3
var knockF = -100
var xp = 0
var speed = 300

var last_dir = "down"

func _physics_process(delta):
	if velocity.y > 0:
		last_dir = "down"
	if velocity.y <  0:
		last_dir = "up"
	if velocity.x < 0:
		last_dir = "left"
	if velocity.x > 0:
		last_dir = "right"
		
	var direction = Input.get_vector("left","right","up","down")
	if direction and !knock:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
		$AniRobson.play("walk_"+last_dir)
	else:# 
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
		$AniRobson.play("idle_"+last_dir)
	move_and_slide()
	
	if xp == 50:
		xp = 0
		
	var mouse_pos = get_global_mouse_position()
		
	if mouse_pos.x > position.x:
		$arma.flip_v = false
	else:
		$arma.flip_v = true
		
	$arma.look_at(mouse_pos)#segue o mouse
	var fps = Engine.get_frames_per_second()
	
	var dir = global_position.direction_to(mouse_pos)
	var distancia = 1
	if Input.is_action_pressed("attack"):
		distancia = 30
		$arma/AArma/ColArma.disabled = false
	else:
		$arma/AArma/ColArma.disabled = true
	$arma.position = dir * distancia
	
	if $"../CanvasLayer/Xp".value == 50:
		$"../CanvasLayer/Xp".value = 0
	if vida == 0:
		get_tree().change_scene_to_file("res://game_over.tscn")
	
	if Input.is_action_pressed("esc"):
		$"../CanvasLayer/Control/ColorRect".visible = true
		get_tree().paused = true
		voltar.grab_focus()

		
func _on_area_robson_area_entered(area):
	if area.is_in_group("lixo"):
		area.queue_free()
		$"../CanvasLayer/Xp".value +=1
		coletado = true
		$"../coleta".play()
		
	if area.is_in_group("enemy"):
		vida -= 1
		$Vida.value -=1
		$"../hit".play()
		knock = true
		var dir_enemy = area.get_parent().target_pos * 3000
		velocity = dir_enemy
		await(get_tree().create_timer(0.1).timeout)
		knock = false
	

func _on_spawn_lixo_timeout():
	pass # Replace with function body.

func _on_a_arma_area_entered(area):
	if area.is_in_group("enemy"):
		area.queue_free()
		$"../CanvasLayer/Xp".value +=1


func _on_voltar_pressed():
	get_tree().paused = false
	$"../CanvasLayer/Control/ColorRect".visible = false
	

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_voltar_mouse_entered():
	$"../menu".play()
func _on_menu_mouse_entered():
	$"../menu".play()
