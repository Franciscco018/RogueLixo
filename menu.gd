extends Control

@onready var transition = $transition
#@onready var transition = $transition/ColorRect

func _on_jogar_pressed():
	transition.play("face_out")
	
	
func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://creditos.tscn")
	
func _on_sair_pressed():
	get_tree().quit()
	
func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://cenaP.tscn")



