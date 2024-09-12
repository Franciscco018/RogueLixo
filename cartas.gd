extends Control

@onready var NomeV:Label= $ColorRect/HBoxContainer/Vida/NomeV 
@onready var NomeVel:Label = $ColorRect/HBoxContainer/Vel/NomeVel
@onready var NomeDist:Label = $ColorRect/HBoxContainer/Dist/NomeDist

@onready var DescricaoV:Label = $ColorRect/HBoxContainer/Vida/DescricaoV
@onready var DescricaoVel:Label = $ColorRect/HBoxContainer/Vel/DescricaoVel
@onready var DescricaoDist:Label = $ColorRect/HBoxContainer/Dist/DescricaoDist

var cartas:Dictionary = {
	"Acelerar" = {"Nome":"Acelerar", "Descrição": "Ganhe 100 de velocidade"},
	"Range" = {"Nome":"Range", "Descrição": "Ganhe 40 de range na arma"},
	"Vida" = {"Nome":"Vida", "Descrição": "Ganhe 2 de vida"}
}

var list_cartas:Array = [cartas["Vida"], cartas["Acelerar"],cartas["Range"]]

func _ready():
	NomeV.text = list_cartas[0]["Nome"]
	NomeVel.text = list_cartas[1]["Nome"]
	NomeDist.text = list_cartas[2]["Nome"]
	
	DescricaoV.text = list_cartas[0]["Descrição"]
	DescricaoVel.text = list_cartas[1]["Descrição"]
	DescricaoDist.text = list_cartas[2]["Descrição"]
