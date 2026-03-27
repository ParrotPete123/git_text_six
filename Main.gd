extends Control
@onready var popup = $LOCKIN
var whitelist = ["chrome", "firefox", "explorer", 
	"searchhost", "applicationframehost", "startmenuexperiencehost", "snippingtool", "shellexperiencehost"]
var setup = true

func _ready() -> void:
	## add current exe to whitelist
	whitelist.append(OS.get_executable_path().split("/")[-1].replace(".exe", "").to_lower())
	
	to_reward_screen()

func _process(_delta: float) -> void:
	if setup:
		return
	var pid = csutil.getCurrentWindow()
	if pid not in [null, 0]:
		var programName = csutil.nameFromPID(pid).to_lower()
		if programName not in whitelist:
			csutil.killFromPID(pid)
			popup.annoy(programName)


func start() -> void:
	$Timer.start($P/V/HBoxContainer/Time.value * 60)
	
	csutil.hideFromHandle(DisplayServer.window_get_native_handle(
		DisplayServer.WINDOW_HANDLE, get_window().get_window_id()))
	setup = false

func done() -> void:
	OS.alert("Study time complete!", "Wow!")
	get_tree().quit()

func to_reward_screen():
	$ZEBACKGORUND/AnimationPlayer.play("cover")
	await get_tree().create_timer(4).timeout
	get_tree().change_scene_to_file("res://rewardMenu/reward_menu.tscn")
