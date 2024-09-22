extends Sprite2D

@onready var enemy = preload("res://enemy2.tscn")

func _physics_process(delta):
	var ene = enemy.instantiate()
	await(get_tree().create_timer(1).timeout)
	queue_free()
	ene.position = global_position
	get_parent().get_parent().add_child(ene)
	
