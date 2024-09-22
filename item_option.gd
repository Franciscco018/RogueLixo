extends TextureRect

var mouse_over = false
var item = null
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var texture_rect: TextureRect = $ColorRect/TextureRect
@onready var nome: Label = $nome
@onready var detalhes: Label = $detalhes
@onready var level: Label = $level

signal selected_upgrade(upgrade)

func _ready() -> void:
	connect("selected_upgrade", Callable(player,"upgrade_character"))
	if item == null:
		item = "food"
	nome.text = UpgradeDb.UPGRADES[item]["display_name"]
	detalhes.text = UpgradeDb.UPGRADES[item]["detalhes"]
	level.text = UpgradeDb.UPGRADES[item]["level"]
	texture_rect.texture = load(UpgradeDb.UPGRADES[item]["icon"])
	
func _input(event):
	if event.is_action("click"):
		if mouse_over:
			emit_signal("selected_upgrade", item)


func _on_mouse_entered() -> void:
	mouse_over = true
func _on_mouse_exited() -> void:
	mouse_over = false
