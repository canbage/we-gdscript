class_name Board


var board : Array
var ranks : int
var files : int

func _init(ranks : int = 8, files : int = 8) -> void:
	self.ranks = ranks
	self.files = files
	
	for x in range(ranks):
		board.append([])
		for y in range(files):
			board[x].append(null)


func set_piece(rank : int, file : int, side : Piece.Side, type) -> void:
	board[rank][file] = type.new(rank, file, side)


func remove_piece(rank : int, file : int) -> void:
	board[rank][file] = null


func get_piece(rank : int, file : int) -> Piece:
	return board[rank][file]


func show_available_moves() -> void:
	pass
	
	
	


func save_board_to_file(file_name : String) -> void:
	var file = FileAccess.open("user://{file_name}.txt".format({"file_name": file_name}), FileAccess.WRITE)
	file.store_var(board)
	file.close()


func load_board_from_file(file_name : String) -> void:
	var file = FileAccess.open("user://{file_name}.txt".format({"file_name": file_name}), FileAccess.READ)
	board = file.get_var()
	file.close()


func print_readable_piece_data(rank : int, file : int) -> void:
	if not board[rank][file]:
		print("There is no piece at ({rank}, {file})".format({"rank": rank, "file": file}))
		return
	
	var data : Dictionary = board[rank][file].get_general_data()
	var side : String
	
	match data.side:
		Piece.Side.WHITE:
			side = "White"
		Piece.Side.BLACK:
			side = "Black"
		Piece.Side.MONSTER:
			side = "Monster"
		Piece.Side.SPY:
			side = "Spy"
		
	print("There is a {side} {type} at {rank}{file}".format({
		"side": side,
		"type": data.type,
		"rank": rank + 1,
		"file": String.chr(file + 65),
		}))


func print_readable_board() -> void:
	for x in range(ranks):
		var stupid_gd : String
		for y in range(files):
			stupid_gd += "{rank}{file}, ".format({"rank": x + 1, "file": String.chr(y + 65)})
		print(stupid_gd)
		stupid_gd = ""
