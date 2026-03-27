extends Control
var preset_data


func _ready():
	initialize_card()

func initialize_card():
	var chosen_card_data = preset_data
	$TextureRect.texture = chosen_card_data.texture
	$cardTitle.text = "[center]" + chosen_card_data.card_name
	$cardDesc.text = chosen_card_data.description
