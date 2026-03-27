extends Control
var which_card = 0
var which_rarity: String = "Common"
var tween: Tween
var can_be_flipped: bool = false
var sideways_velocity: Vector2
var return_velocity: Vector2
var returning: bool
var chosen_card_data
var card_pack_ref #only used when a card is pulled out of a pack

func _ready():
	position -= $Texture.size/2
	if card_pack_ref:
		card_pack_ref.finish_pack.connect(on_pack_finish)
	if can_be_flipped:
		var luck_value = randi_range(1,85)
		if luck_value <= 50:
			which_rarity = "Common"
		elif luck_value <= 85:
			which_rarity = "Rare"
		elif luck_value <= 95:
			which_rarity = "Super Rare"
		elif luck_value <= 99:
			which_rarity = "Epic"
		else:
			which_rarity = "Legendary"
		which_card = randi_range(0,Gv.card_list[which_rarity].size()-1)
	initialize_card()
	if can_be_flipped:
		scale.x = 0
		reset_tween()
		tween.tween_property(self,"scale",Vector2(1,1),0.2).set_trans(Tween.TRANS_EXPO)

func _physics_process(_delta: float) -> void:
	if returning:
		return_card(_delta)

func initialize_card():
	chosen_card_data = Gv.card_list[which_rarity][which_card]
	$"2D/card/M/TextureRect".texture = chosen_card_data.texture
	$"2D/card/cardTitle".text = "[center]" + chosen_card_data.card_name
	$"2D/card/cardDesc".text = chosen_card_data.description
	if can_be_flipped:
		chosen_card_data.copies += 1
		if Gv.owned_set_list.has(chosen_card_data.card_name):
			Gv.owned_set_list[chosen_card_data.card_name] += 1
		else:
			Gv.owned_set_list[chosen_card_data.card_name] = 1
		SaveData.saveData()

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func return_card(delta):
	var return_speed = 600.0
	return_velocity = (Vector2(725,925)-global_position).normalized()*return_speed
	sideways_velocity = lerp(sideways_velocity,Vector2(0,0),0.04)
	return_speed = lerpf(return_speed,800.0,0.05)
	scale -= Vector2(0.01,0.01)
	global_position += (return_velocity+sideways_velocity)*delta
	if (Vector2(725,925)-global_position).length() < 40:
		queue_free()

func on_pack_finish():
	sideways_velocity = Vector2(1,0).rotated(randf_range(0,-PI))*randf_range(900,1200)
	returning = true
