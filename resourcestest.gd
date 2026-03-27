extends Node2D
@export var list:Array[bob] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for b in list:
		print(b.alexIsSmart)
		print(b.avkashIsSmart)
		print(b.avkashIsGodotMaster)
		print()
