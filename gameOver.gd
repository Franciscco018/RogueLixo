extends Control

@onready var transition = $transition

func _on_jogar_pressed():
	transition.play("face_out")


func _on_transition_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://menu.tscn")
