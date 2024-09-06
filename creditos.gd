extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_voltar_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_voltar_mouse_entered():
	$menu.play()


func _on_proximo_pressed():
	get_tree().change_scene_to_file("res://creditos2.tscn")


func _on_proximo_mouse_entered():
	$menu.play()
