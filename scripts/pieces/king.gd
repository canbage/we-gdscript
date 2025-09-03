class_name King extends Piece

#func get_available_moves(board : Array) -> Array:
	#
	#return []

var data : Dictionary = {
	name = "",
	uses_special_movement = true,
	special_movement = [
		Vector2i(0, -1),
		Vector2i(1, -1),
		Vector2i(1, 0),
		Vector2i(1, 1),
		Vector2i(0, 1),
		Vector2i(-1, 1),
		Vector2i(-1, 0),
		Vector2i(-1, -1),
	],
}
