extends Control


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://creditos.tscn")


func _on_voltar_mouse_entered():
	$menu.play()
