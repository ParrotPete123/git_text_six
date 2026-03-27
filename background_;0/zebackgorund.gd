extends Node2D
var vector_length: float = 1
var vector_rot: float = 1
var color_vector: Vector3 = Vector3(1,1,1)
@export var conscience_path: PackedScene
var spawn_timer: int = 200

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	spawn_timer -= 1
	color_vector = color_vector.rotated(Vector3(0,0,1),0.005)
	self.modulate = Color(color_vector.x,color_vector.y,color_vector.z)
	if spawn_timer <= 0:
		var conscience = conscience_path.instantiate()
		conscience.x_vel = randf_range(-600,600)
		self.add_child(conscience)
		spawn_timer = randi_range(0,20)
