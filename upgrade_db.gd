extends Node

const ICON_PATH = "res://assets/Itens/Upgrades/"
const WEAPON_PATH = "res://assets/Itens/Weapons/"
const UPGRADES = {
	"vel": {
		"icon": ICON_PATH + "speed_card.png",
		"display_name": "Velocidade",
		"detalhes": "Ganhe 25 de velocidade",
		"level": "level: 1",
		"prerequisite": [],
		"type": "weapon" 
	},
	"vel2": {
		"icon": ICON_PATH + "speed_card.png",
		"display_name": "Velocidade",
		"detalhes": "Ganhe 25 de velocidade",
		"level": "level: 2",
		"prerequisite": ["vel"],
		"type": "weapon" 
	},
	"vel3": {
		"icon": ICON_PATH + "speed_card.png",
		"display_name": "Velocidade",
		"detalhes": "Ganhe 25 de velocidade",
		"level": "level: 3",
		"prerequisite": ["vel2"],
		"type": "weapon" 
	},
	"vel4": {
		"icon": ICON_PATH + "speed_card.png",
		"display_name": "Velocidade",
		"detalhes": "Ganhe 25 de velocidade",
		"level": "level: 4",
		"prerequisite": ["vel3"],
		"type": "weapon" 
	},
	"vel5": {
		"icon": ICON_PATH + "speed_card.png",
		"display_name": "Velocidade",
		"detalhes": "Ganhe 25 de velocidade",
		"level": "level: 5",
		"prerequisite": ["vel4"],
		"type": "weapon" 
	},
	"dist": {
		"icon": ICON_PATH + "dist.png",
		"display_name": "Distancia",
		"detalhes": "Aumente sua distancia em 1",
		"level": "level: 1",
		"prerequisite": [],
		"type": "weapon" 
	},
	"dist2": {
		"icon": ICON_PATH + "dist.png",
		"display_name": "Distancia",
		"detalhes": "Aumente sua distancia em 1",
		"level": "level: 2",
		"prerequisite": ["dist"],
		"type": "weapon" 
	},
	"dist3": {
		"icon": ICON_PATH + "dist.png",
		"display_name": "Distancia",
		"detalhes": "Aumente sua distancia em 1",
		"level": "level: 3",
		"prerequisite": ["dist2"],
		"type": "weapon" 
	},
	"bomb": {
		"icon": ICON_PATH + "bomba.png",
		"display_name": "Bomba",
		"detalhes": "A cada 5 segundos uma bomba explode",
		"level": "level: 1",
		"prerequisite": [],
		"type": "weapon" 
	},
	"bomb2": {
		"icon": ICON_PATH + "bomba.png",
		"display_name": "Bomba",
		"detalhes": "Aumente o range da explosao",
		"level": "level: 2",
		"prerequisite": ["bomb"],
		"type": "weapon" 
	},
	"bomb3": {
		"icon": ICON_PATH + "bomba.png",
		"display_name": "Bomba",
		"detalhes": "Aumente o range da explosao",
		"level": "level: 3",
		"prerequisite": ["bomb2"],
		"type": "weapon" 
	},
	"bomb4": {
		"icon": ICON_PATH + "bomba.png",
		"display_name": "Bomba",
		"detalhes": "Aumente o range da explosao",
		"level": "level: 4",
		"prerequisite": ["bomb3"],
		"type": "weapon" 
	},
	"shuriken": {
		"icon": ICON_PATH + "shurikenIcon.png",
		"display_name": "Shuriken",
		"detalhes": "Crie uma shuriken em sua volta",
		"level": "level: 1",
		"prerequisite": [],
		"type": "weapon" 
	},
	"shuriken2": {
		"icon": ICON_PATH + "shurikenIcon.png",
		"display_name": "Shuriken",
		"detalhes": "Crie mais 2 shurikens",
		"level": "level: 2",
		"prerequisite": ["shuriken"],
		"type": "weapon" 
	},
	"shuriken3": {
		"icon": ICON_PATH + "shurikenIcon.png",
		"display_name": "Shuriken",
		"detalhes": "Novo Zoro, fique com 3 shurikens",
		"level": "level: 3",
		"prerequisite": ["shuriken2"],
		"type": "weapon" 
	},
	"shuriken4": {
		"icon": ICON_PATH + "shurikenIcon.png",
		"display_name": "Shuriken",
		"detalhes": "Fique incontrolavel com 4 shurikens",
		"level": "level: 4",
		"prerequisite": ["shuriken3"],
		"type": "weapon" 
	},
	"shuriken5": {
		"icon": ICON_PATH + "shurikenIcon.png",
		"display_name": "Shuriken",
		"detalhes": "FIQUE COM 5 FUCKING SHURIKENS",
		"level": "level: 5",
		"prerequisite": ["shuriken4"],
		"type": "weapon" 
	},
	"food": {
		"icon": ICON_PATH + "vida.png",
		"display_name": "Vida",
		"detalhes": "Ganhe 1 de vida",
		"level": "",
		"prerequisite": [],
		"type": "item" 
	},
}
