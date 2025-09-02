class_name Piece

const UP = Vector2i(0, -1)
const UP_RIGHT = Vector2i(1, -1)
const RIGHT = Vector2i(1, 0)
const DOWN_RIGHT = Vector2i(1, 1)
const DOWN = Vector2i(0, 1)
const DOWN_LEFT = Vector2i(-1, 1)
const LEFT = Vector2i(-1, 0)
const UP_LEFT = Vector2i(-1, -1)

var rank : int
var file : int
var position_vector : Array
var side : Side

enum Side {
	WHITE,
	BLACK,
	MONSTER,
	SPY,
}


func _init(rank : int, file : int, side = Piece.Side) -> void:
	self.rank = rank
	self.file = file
	position_vector = [rank, file]
	self.side = side


func get_available_moves(board : Array) -> Array:
	return []


func scan_direction(steps : int, direction : Array) -> Array:
	var positions : Array
	
	for i in range(steps):
		positions.append(add_2_arrays(position_vector, multiply_array(direction, i + 1)))
	
	return positions


func add_2_arrays(a : Array, b : Array) -> Array:
	return [a[0] + b[0], a[1] + b[1]]


func multiply_array(a : Array, b : int) -> Array:
	return [a[0] * b, a[1] * b]


func get_general_data() -> Dictionary:
	var data := {
		side = side,
		type = get_script().get_global_name(),
		rank = rank,
		file = file,
	}
	return data
