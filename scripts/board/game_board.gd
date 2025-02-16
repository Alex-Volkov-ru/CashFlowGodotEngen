extends Node2D

@onready var bluefishka: Sprite2D = get_tree().get_first_node_in_group("bluefishka")
@export var game_space: Array[Node2D]
@onready var dice: Sprite2D = $"../Dice"
@onready var timer: Timer = $Timer

var place: int = 0


func _on_dice_dice_has_rolled(roll: Variant) -> void:
	#Строчка для тестинга клеток
	#roll = 15
	while roll != 0:
		await (move(place))
		place += 1
		roll -= 1
		if place >= game_space.size():  # Если дошли до конца массива, сбрасываем индекс
			place = 0


func move(place)-> void:
	var tween = create_tween()
	tween.tween_property(bluefishka, 'position', game_space[place].position, 1)
	timer.start()
	await timer.timeout
	
