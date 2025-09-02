extends Node

var board : Board


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	board = Board.new()
	board.print_readable_board()
	board.set_piece(0, 0, Piece.Side.WHITE, King)
	board.print_readable_piece_data(0, 0)
	
	var file = FileAccess.get_file_as_string("res://scripts/pieces/pieces.json")
	var parsed_data = JSON.parse_string(file)
	
	print(parsed_data)
