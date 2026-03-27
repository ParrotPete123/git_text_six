extends Label
var text_selection := {
	"positive": ["Studying is fun!","You got this!","Study hard!","Hard work = results!","You are valued.","Yipee!","The hardest part is starting!","Yay!!!","I heart study!"],
	"passive_aggresive": ["Betraying your lineage again?","SMH buddy.","Studying exists, yaknow","No work = Nothing","Ick. A non-studier.","Hop off maybe?",":skull:",
	"On Instagram again?","Hop off brawl.","Playing Fortnite? SMH.","And you're wondering why you have B's","Just start studying.","Can you study?","Do you need motivation?",
	"Self discipline, hello?","Get off your phone, kid.","You missed another LaRosa reading quiz?","Just Stop. Start Study."],
	"None": [],
}
var possible_text: Array
var x_vel:float = 0
var which_attitude: String = "passive_aggresive"

func _ready():
	global_position.y = 1400
	global_position.x = randf_range(100,725)
	possible_text = text_selection[which_attitude].duplicate()
	self.text = possible_text.pick_random()

func _physics_process(delta: float) -> void:
	global_position.x += x_vel*delta
	global_position.y += -300*delta
	x_vel -= x_vel*(abs(x_vel)/100.0)*delta
