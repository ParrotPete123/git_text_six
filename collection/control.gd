extends Control
var card_name
var amount


func _ready():
	initialize_card()

func initialize_card():
	var chosen_card_data = Gv.nameToCard[card_name]
	$"2D/card/M/TextureRect".texture = chosen_card_data.texture
	$"2D/card/cardTitle".text = "[center]" + card_name
	$"2D/card/cardDesc".text = chosen_card_data.description
	if amount > 1:
		$displayAmount.show()
		$displayAmount.text = "[center][wave]" + str(amount) + "X"
