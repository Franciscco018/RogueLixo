extends Node2D

@onready var NomeV:Label= $Control/Vida/NomeV
@onready var NomeVel:Label = $Control/Vel/NomeVel
@onready var NomeDist:Label = $Control/Dist/NomeDist

@onready var DescricaoV:Label = $Control/Vida/DescricaoV
@onready var DescricaoVel:Label = $Control/Vel/DescricaoVel
@onready var DescricaoDist:Label = $Control/Dist/DescricaoDist

var cartas:Dictionary = {
	"Acelerar" = {"Nome":"Acelerar", "Descrição": "Ganhe 100 de velocidade"},
	"Range" = {"Nome":"Range", "Descrição": "Ganhe 40 de range na arma"},
	"Vida" = {"Nome":"Vida", "Descrição": "Ganhe 2 de vida"}
}

var list_cartas:Array = [cartas["Acelerar"],cartas["Range"],cartas["Vida"]]

func _ready():
	NomeV.text = list_cartas[1]
