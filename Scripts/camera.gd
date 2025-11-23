extends Camera3D
@onready var ray = $RayCast3D
@onready var pick = $"../../ColorRect"

var looking = false

func _ready() -> void:
	pick.visible = false

func _physics_process(delta: float) -> void:
	if ray.is_colliding():
		var collider = ray.get_collider()
		print(collider)
		
		if collider.name == 'Pistol':
			if !looking:
				looking = true
				pick.visible = true
		else:
			if looking:
				looking = false
				pick.visible = false
	else:
		if looking:
			looking = false
			pick.visible = false
	
