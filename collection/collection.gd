extends Control

func _ready():
	for card in Gv.owned_set_list:
		var display = load("res://collection/control.tscn").instantiate()
		display.card_name = card
		display.amount = Gv.owned_set_list[card]
		$ScrollContainer/VBoxContainer/GridContainer.add_child(display)

func _physics_process(_delta: float) -> void:
	for n in $ScrollContainer/VBoxContainer/GridContainer.get_children():
		if not n.card_name.to_lower().contains($ScrollContainer/VBoxContainer/TextEdit.text.to_lower()) and not $ScrollContainer/VBoxContainer/TextEdit.text == "":
			n.hide()
		else:
			n.show()
