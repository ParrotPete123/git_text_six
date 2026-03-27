extends TextureRect
var hover = false
var maxRotX = PI/6
var maxRotY = PI/6
@export var animSpeed = 10.0

@onready var pivot = $"../3D/Pivot"

func _process(delta: float) -> void:
	var targetX = 0
	var targetY = 0
	if hover:
		var mousePos = get_global_mouse_position()
		var rel = mousePos - (global_position + get_parent().size/2)
		var percent = rel/(get_parent().size/2)
		targetX = maxRotX*percent.x
		targetY = maxRotY*percent.y
	pivot.rotation.y = lerpf(pivot.rotation.y, targetX, delta*animSpeed)
	pivot.rotation.x = lerpf(pivot.rotation.x, targetY, delta*animSpeed)


func mouseEnter() -> void:
	hover = true

func mouseLeave() -> void:
	hover = false
