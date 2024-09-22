extends CharacterBody2D

@onready var lixo = preload("res://lixo.tscn")
@onready var voltar = $"../CanvasLayer/Control/ColorRect/VBoxContainer/Voltar"
@onready var level_bar: Label = $"../CanvasLayer/Xp/level_bar"
@onready var levelPanel = get_node("%LevelUp")
@onready var upgradeOptions = get_node("%UpgradeOptions")
@onready var sndLevelUp = get_node("%snd_levelUp")
@onready var itemOptions = preload("res://item_option.tscn")

var level = 1

var knock = false
var jogador_detectado = false
var coletado = false
var enemy_morreu = false
var screen_shake= false

var upgradeDist:int = 1

var collected_upgrades = []
var upgrades_options = []

var vida = 3
var knockF = -100
var xp = 0
var speed = 300
var distancia = 1
var rotacao = 0
var dist = 150

var last_dir = "down"


func _physics_process(delta):
	if screen_shake == true:
		shake_screen()
	else:
		$Camera2D.offset - Vector2.ZERO	
	
	if velocity.y > 0:
		last_dir = "down"
	if velocity.y <  0:
		last_dir = "up"
	if velocity.x < 0:
		last_dir = "right"
		$AniRobson.flip_h = true
	if velocity.x > 0:
		last_dir = "right"
		$AniRobson.flip_h = false
		
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
		
	var mouse_pos = get_global_mouse_position()
		
	if mouse_pos.x > position.x:
		$arma.flip_v = false
	else:
		$arma.flip_v = true
		
	$arma.look_at(mouse_pos)#segue o mouse
	var fps = Engine.get_frames_per_second()
	
	var dir = global_position.direction_to(mouse_pos)
	
	if Input.is_action_pressed("attack"):
		distancia = 30
		$arma/AArma/ColArma.disabled = false
	else:
		$arma/AArma/ColArma.disabled = true
	$arma.position = dir * distancia * upgradeDist
	distancia = 1
	
	var offset = Vector2(1,0).rotated(deg_to_rad(rotacao)) * dist
	var offset2 = Vector2(1,0).rotated(deg_to_rad(rotacao + 72)) * dist
	var offset3 = Vector2(1,0).rotated(deg_to_rad(rotacao + 144)) * dist
	var offset4 = Vector2(1,0).rotated(deg_to_rad(rotacao + 216)) * dist
	var offset5 = Vector2(1,0).rotated(deg_to_rad(rotacao + 288)) * dist
	rotacao += 2
	
	$shuriken.global_position = global_position + offset
	$shuriken2.global_position = global_position + offset2
	$shuriken3.global_position = global_position + offset3
	$shuriken4.global_position = global_position + offset4
	$shuriken5.global_position = global_position + offset5
	
	
	if $"../CanvasLayer/Xp".value >= 1:#$"../CanvasLayer/Xp".max_value:
		$"../CanvasLayer/Xp".value = 0
		$"../CanvasLayer/Xp".max_value += 10
		levelUp()
		level += 1
		level_bar.text = str("Level: ", level)
		
	if vida == 0:
		get_tree().change_scene_to_file("res://game_over.tscn")
		
	if Input.is_action_pressed("esc"):
		$"../CanvasLayer/Control/ColorRect".visible = true
		get_tree().paused = true
func _on_area_robson_area_entered(area):
	if area.is_in_group("lixo"):
		area.queue_free()
		$"../CanvasLayer/Xp".value +=1
		coletado = true
		$"../coleta".play()
		
	if area.is_in_group("enemy"):
		vida -=1
		$"../CanvasLayer/Vida".value -=1
		$"../hit".play()
		knock = true
		var dir_enemy = area.get_parent().target_pos * 1800
		velocity = dir_enemy
		await(get_tree().create_timer(0.1).timeout)
		knock = false
		

func _on_spawn_lixo_timeout():
	pass # Replace with function body.
func _on_a_arma_area_entered(area):
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
func _on_voltar_pressed():
	get_tree().paused = false
	$"../CanvasLayer/Control/ColorRect".visible = false
func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
func _on_voltar_mouse_entered():
	$"../menu".play()
func _on_menu_mouse_entered():
	$"../menu".play()

func levelUp():
	var tween = levelPanel.create_tween()
	tween.tween_property(levelPanel, "position",Vector2(120,100),0.5).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	levelPanel.visible = true
	var options = 0
	var max_options = 3
	while options < max_options:
		var option_choice = itemOptions.instantiate()
		option_choice.item = get_random_item()
		upgradeOptions.add_child(option_choice)
		options +=1 
	get_tree().paused = true
	await(get_tree().create_timer(0.4).timeout)
	sndLevelUp.play()
	
func upgrade_character(upgrade):
	match upgrade:
		"vida":
			if $"../CanvasLayer/Vida".value == $"../CanvasLayer/Vida".max_value:
				$"../CanvasLayer/Vida".max_value +=1
				vida += 1
			else:
				vida += 1
				$"../CanvasLayer/Vida".value +=1
		"vel","vel2","vel3","vel4","vel5":
			speed += 25
		"dist","dist2","dist3":
			upgradeDist += 1
		"bomb":
			$"../ataque".start()
		"bomb2","bomb3","bomb4":
			$bomba.scale += Vector2(0.5,0.5)
		"shuriken":
			$shuriken.visible = true
			$shuriken/CollisionShape2D.disabled = false
		"shuriken2":
			$shuriken2.visible = true
			$shuriken2/CollisionShape2D.disabled = false
		"shuriken3":
			$shuriken3.visible = true
			$shuriken3/CollisionShape2D.disabled = false
		"shuriken4":
			$shuriken4.visible = true
			$shuriken4/CollisionShape2D.disabled = false
		"shuriken5":
			$shuriken5.visible = true
			$shuriken5/CollisionShape2D.disabled = false
		
	var option_chielren = upgradeOptions.get_children()
	for i in option_chielren:
		i.queue_free()
	upgrades_options.clear()
	collected_upgrades.append(upgrade)
	levelPanel.visible = false
	levelPanel.position = Vector2(-1440, 100)
	get_tree().paused = false
func get_random_item():
	var dblist = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades:
			pass
		elif i in upgrades_options:
			pass
		elif UpgradeDb.UPGRADES[i]["type"] == "item":
			pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0:
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collected_upgrades:
					pass
				else:
					dblist.append(i)
		else:
			dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist.pick_random()
		upgrades_options.append(randomitem)
		return randomitem
	else:
		return null

func bomba():
	$bomba.visible = true
	$bomba/rangeBomba.disabled = false
	$bomba/explosao.play("default")
	start_screen_shake()
	$"../explosion".play()
	await(get_tree().create_timer(0.5).timeout)
	$bomba.visible = false
	$bomba/rangeBomba.disabled = true


func _on_ataque_timeout() -> void:
	bomba()


func _on_bomba_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
			
func shake_screen():
	$Camera2D.offset = Vector2(randf_range(-5,5),randf_range(-5,5))
func start_screen_shake():
	screen_shake = true
	await(get_tree().create_timer(0.9).timeout)
	screen_shake = false


func _on_shuriken_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
func _on_shuriken_2_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
func _on_shuriken_3_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
func _on_shuriken_4_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
func _on_shuriken_5_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		if area.get_parent().vidaE == 0:
			$"../CanvasLayer/Xp".value +=1
