extends ScrollContainer

func _ready():
	for card in Gv.owned_set_list:
		var display = preload("res://collection/control.tscn").instantiate()
		display.custom_minimum_size/=1.5
		display.card_name = card
		display.amount = Gv.owned_set_list[card]
		$VBoxContainer/GridContainer.add_child(display)

func _physics_process(_delta: float) -> void:
	for n in $VBoxContainer/GridContainer.get_children():
		if not n.card_name.to_lower().contains(%TextEdit.text.to_lower()) and not %TextEdit.text == "":
			n.hide()
		else:
			n.show()
