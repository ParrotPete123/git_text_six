extends Sprite2D
var movement_vect := Vector2(1,0).rotated(randf_range(-PI,PI))
var texture_list = ["res://rewardMenu/packParticles/lock5in-reward_screen.png","res://rewardMenu/packParticles/lock5in-reward_screen.png",
"res://rewardMenu/packParticles/lockin-1reward_screen.png","res://rewardMenu/packParticles/lockin-2reward_screen.png","res://rewardMenu/packParticles/lockin6-reward_screen.png",
"res://rewardMenu/packParticles/lockin-rewa7rd_screen.png","res://rewardMenu/packParticles/lockin-reward8_screen.png"]
var skew_speed: float = randf_range(9,15)
var speed: float = randf_range(600,800)

func _ready():
	global_rotation = randf_range(-PI,PI)
	global_position = Vector2(720,412.25)
	self.texture = load(texture_list[randi_range(0,texture_list.size()-1)])

func _physics_process(delta: float) -> void:
	self.skew += skew_speed*delta
	global_position += movement_vect*speed*delta
	
	skew_speed = lerpf(skew_speed,0.1,0.05)
	speed = lerpf(speed,60.0,0.05)
