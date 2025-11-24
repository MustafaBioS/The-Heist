extends Area3D
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
const Balloon = preload("uid://c8wv5y631kd5u")

func action() -> void:
	if State.firstdial == false:
		State.in_dialogue = true
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(dialogue_resource, dialogue_start)
		
func _on_body_entered(body: Node3D) -> void:
	if body.has_method("player"):
		print(State.firstdial)
		print(State.in_dialogue)
		action()
		print("dialogue started")
		print(State.in_dialogue)
		print(State.firstdial)
