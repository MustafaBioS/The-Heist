extends Control
@onready var start = $Buitons/Start
@onready var options = $Buitons/Options
@onready var exit = $Buitons/Exit
@onready var wip = $WiP


func _ready() -> void:
	wip.visible = false


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
	

func _on_options_pressed() -> void:
	wip.visible = true
	

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	wip.visible = false
