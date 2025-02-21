extends CharacterBody2D

@export_range(0,1000) var speed := 60

func _physics_process(_delta: float) -> void:
	get_player_input()
	if move_and_slide():
		resolve_collisions()

func resolve_collisions() -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i) 
		var body := collision.get_collider() as MovableObject 
		if body:
			body.apply_impact(velocity)
	

func get_player_input() -> void:
	var vector := Input.get_vector("MoveLeft","MoveRight","MoveUp","MoveDown")
	velocity = vector * speed
