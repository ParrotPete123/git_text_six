extends Node2D
var anchor_position: Vector2
var tween: Tween
var reward_menu_ref
var is_button_down: bool = false
var mouse_enter_pos: Vector2
var ready_to_open = false
signal finish_pack
var is_pack_finished = false
var card_display_list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#global_position = Vector2(720,415.25)
	reward_menu_ref.pack_ref.push_front(self)
	anchor_position = global_position
	global_position.y += 700
	await get_tree().create_timer(0.15).timeout
	reset_tween()
	tween.tween_property(self,"scale",Vector2(0.75,0.75),0.1)
	#get_ready_open()

func _physics_process(_delta: float) -> void:
	global_position = lerp(global_position,anchor_position,0.1)
	if is_pack_finished:
		if Input.is_action_just_pressed("click"):
			is_pack_finished = false
			finish_pack.emit()
			reward_menu_ref.open_pack()

func reset_tween():
	if tween:
		tween.kill()
	tween = create_tween()

func get_ready_open():
	ready_to_open = true
	anchor_position = Vector2(725,412.25)
	await get_tree().create_timer(0.15).timeout
	reset_tween()
	tween.tween_property(self,"scale",Vector2(1,1),0.1)
	$Button.show()

func _on_button_pressed() -> void:
	open_pack()

func open_pack():
	#reward_menu_ref.open_pack()
	if ready_to_open:
		self.hide()
		for n in 15:
			var pack_particle = preload("res://rewardMenu/packParticles/pack_particle.tscn").instantiate()
			get_parent().add_child(pack_particle)
		for n in 3:
			var card_display = preload("res://rewardMenu/cardDisplay/card_display.tscn").instantiate()
			card_display.global_position = global_position
			card_display.anchor_pos = Vector2(725,315.25) - Vector2(125,0)*2 + Vector2(250,0)*n
			card_display.card_pack_ref = self
			card_display.display_id = n
			get_parent().add_child(card_display)
			await get_tree().create_timer(0.1).timeout
