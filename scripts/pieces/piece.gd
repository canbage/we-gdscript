class_name Piece


enum Side {
	WHITE,
	BLACK,
	MONSTER,
	SPY,
}

const UP = [0, -1]
const UP_RIGHT = [1, -1]
const RIGHT = [1, 0]
const DOWN_RIGHT = [1, 1]
const DOWN = [0, 1]
const DOWN_LEFT = [-1, 1]
const LEFT = [-1, 0]
const UP_LEFT = [-1, -1]

static var parsed_piece_data

var rank : int
var file : int
var position_vector : Array
var side : Piece.Side

var this_piece_data : Dictionary
var type : String
var movement

static func load_piece_data() -> void:
	if parsed_piece_data:
		return
	var raw_data = FileAccess.get_file_as_string("res://scripts/pieces/pieces.json")
	parsed_piece_data = JSON.parse_string(raw_data)


func _init(rank : int, file : int, side : Piece.Side, piece : String) -> void:
	self.rank = rank
	self.file = file
	position_vector = [rank, file]
	self.side = side
	
	load_piece_data()
	
	this_piece_data = parsed_piece_data[piece]
	
	type = this_piece_data.type
	movement = this_piece_data.movement


func get_available_moves(board : Array) -> Dictionary:
	if movement is Dictionary:
		for i in movement:
			print(movement[i])
	
	
	return {}


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
		type = type,
		rank = rank,
		file = file,
	}
	return data
