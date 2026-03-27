extends Node2D

func _ready():
	for n in Gv.owned_set_list:
		for j in Gv.owned_set_list[n]:
			var display = load("res://collection/control.tscn").instantiate()
			display.preset_data = j
			$ScrollContainer/VBoxContainer/GridContainer.add_child(display)
