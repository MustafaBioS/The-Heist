extends Area3D
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
const Balloon = preload("uid://bcowc244xwtwl")

func action() -> void:
	if State.firstdial == false:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		
func _on_body_entered(body: Node3D) -> void:
	if body.has_method("player"):
		print(State.first_dial_done)
		print(State.in_dial)
		action()
		print("dialogue started")
		print(State.in_dial)
		print(State.first_dial_done)
