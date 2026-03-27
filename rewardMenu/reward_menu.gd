extends Node2D

var reward_phase = 0
var packs_earned = 1
var pack_ref = []
@export var pack_display_path: PackedScene

func _on_continue_button_pressed() -> void:
	reward_phase += 1
	if reward_phase == 1:
		%AnimationPlayer.play("time_animation")
		await get_tree().create_timer(2).timeout
		_on_continue_button_pressed()
	elif reward_phase == 2:
		%AnimationPlayer.play_backwards("time_animation")
	elif reward_phase == 3:
		$cardPacks/packs.show()
		for n in packs_earned:
			$cardPacks/packs.text = "[center]X" + str(n+1)
			var pack_display = pack_display_path.instantiate()
			pack_display.position = Vector2(725,545.25) - Vector2(0,15)*n
			pack_display.reward_menu_ref = self
			$cardPacks.add_child(pack_display)
			await get_tree().create_timer(0.1).timeout
	elif reward_phase == 4:
		%AnimationPlayer.play_backwards("reward_animation")
		await get_tree().create_timer(1.2).timeout
		open_pack()
	elif reward_phase == 5:
		%AnimationPlayer.play_backwards("continue")
		await get_tree().create_timer(0.3).timeout
		get_tree().change_scene_to_file("res://collection/collection.tscn")
	
func open_pack():
	if pack_ref.size() > 0:
		pack_ref.pop_front().get_ready_open()
		$cardPacks/packs.text = "[center]X" + str(pack_ref.size())
	else:
		$cardPacks/packs.hide()
		%AnimationPlayer.play("continue")
