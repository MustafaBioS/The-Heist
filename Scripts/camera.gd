extends Camera3D
@onready var ray = $RayCast3D
@onready var weapon = $"../../Weapon"
@onready var laptopPick = $"../../LaptopPick"

var looking = false

func _ready() -> void:
	weapon.visible = false
	laptopPick.visible = false

func _physics_process(delta: float) -> void:
	if ray.is_colliding():
		var collider = ray.get_collider()
		print(collider)
		
		if collider.name == 'Pistol':
			if !looking:
				looking = true
				weapon.visible = true
		
		elif collider.name == 'Laptop':
			if !looking:
				looking = true
				laptopPick.visible = true
		
		else:
			if looking:
				looking = false
				weapon.visible = false
				laptopPick.visible = false
	else:
		if looking:
			looking = false
			weapon.visible = false
	
