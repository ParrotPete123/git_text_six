extends Window

func _ready() -> void:
	hide()

func annoy(exeName: String):
	$P/V/Info.text = "%s is not an allowed application." % exeName.capitalize()
	show()


func okPressed() -> void:
	hide()
