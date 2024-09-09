extends Sprite2D

@onready var enemy = preload("res://enemy.tscn")

func _physics_process(delta):
	var ene = enemy.instantiate()
	await(get_tree().create_timer(1).timeout)
	queue_free()
	get_parent().get_parent().add_child(ene)
	
