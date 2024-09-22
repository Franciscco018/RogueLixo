extends Control

@onready var transition = $transition


func _on_jogar_pressed():
	transition.play("face_out")
	
	
func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://creditos.tscn")

	
func _on_sair_pressed():
	get_tree().quit()
	
func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://cenaP.tscn")


func _on_jogar_mouse_entered():
	$menu1.play()
func _on_creditos_mouse_entered():
	$menu1.play()
func _on_sair_mouse_entered():
	$menu1.play()


func _on_btn_pressed() -> void:
	$TextureRect/ColorRect/veigar.visible = true


func _on_btn_2_pressed() -> void:
	$TextureRect/ColorRect/sla.visible = true
	$music_menu.stop()
	$TextureRect/ColorRect/music2.play()
