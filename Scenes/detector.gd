extends Area2D

@export_color_no_alpha var invalid_color := Color.RED
@export_color_no_alpha var valid_color := Color.GREEN
@export var sprite : Sprite2D

var hoveringBodies : Array[Node2D]= []

func _on_body_entered(body: Node2D) -> void:
	hoveringBodies.append(body)
	_refresh()

func _on_body_exited(body: Node2D) -> void:
	hoveringBodies.erase(body)
	_refresh()

func _refresh():
	var hovering := hoveringBodies.size() > 0
	sprite.modulate = valid_color if hovering else invalid_color;
