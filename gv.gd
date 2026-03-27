extends Node

var card_list = {
	"Common": [
		CardData.new("Biped Dog","people thought he just wanted to be human, but he actually dreams of becoming a bowling pin.","misfits"),
		CardData.new("Cat","Just a cat.","misfits"),
		CardData.new("Horse","Just a hourse.","misfits"),
		CardData.new("House","Wishes it was a hourse.","misfits"),
		CardData.new("Clown","Dislikes a certain movie.","misfits"),
		CardData.new("Ronald","No, his last name is not McDonald","misfits"),
		CardData.new("Pete","A classic classy name for not-so-classy people.","misfits"),
		CardData.new("Tom Joad","Bettah go on The Old Town Joad, friends.","misfits"),
		CardData.new("Six Feet","Would you rather be six foot or six feet?","misfits"),
		CardData.new("Wick Witch","'From my Keanu Sleeves I pull out a dead dog!'","misfits"),
	],
	"Rare": [],
	"Super Rare": [],
	"Epic": [],
	"Legendary": [],
}

var set_list = {
	"misfits": []
}

var owned_set_list = {
	"misfits": []
}

func _ready():
	for n in card_list:
		for j in card_list[n]:
			set_list[j.which_set].append(j)
