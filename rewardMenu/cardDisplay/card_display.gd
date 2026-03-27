extends Node2D

var anchor_pos: Vector2 = Vector2(0,0)
var tween: Tween
var display_id = 0
var card_pack_ref


func _ready():
	scale = Vector2(0,1)
	reset_tween()
	tween.set_parallel()
	tween.tween_property(self,"global_position",anchor_pos,0.5)
	tween.tween_property(self,"scale",Vector2(1,1),0.5)

func _on_button_pressed() -> void:
	reset_tween()
	tween.tween_property(self,"scale",Vector2(0,1),0.2)
	await get_tree().create_timer(0.2).timeout
	var card = load("res://cards/card.tscn").instantiate()
	card.card_pack_ref = card_pack_ref
	card.global_position = global_position
	card.can_be_flipped = true
	get_parent().add_child(card)
	if display_id == 2:
		card_pack_ref.is_pack_finished= true #BUG HERE, REMEMBER TO FIXY FIX

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()
