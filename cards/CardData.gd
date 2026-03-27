extends Node
class_name CardData

var description: String
var card_name: String
var texture
var copies: int = 0
var which_set: String

func _init(input_name,input_desc,input_set="nah"):
	card_name = input_name
	description = input_desc
	which_set = input_set
	texture = load("res://cards/cardAssets/%s.png" % card_name)
