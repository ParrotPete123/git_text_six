extends Node
var fileName = "user://cards.dat"

func saveData():
	var data = Gv.owned_set_list
	
	var saveFile = FileAccess.open(fileName, FileAccess.WRITE)
	saveFile.store_var(data, true)
	saveFile.close()

func loadData():
	var saveFile = FileAccess.open(fileName, FileAccess.READ)
	if !saveFile:
		return
	Gv.owned_set_list = saveFile.get_var(true)
	print(Gv.owned_set_list)
