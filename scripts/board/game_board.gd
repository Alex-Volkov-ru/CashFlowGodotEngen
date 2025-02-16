extends Node2D

@onready var bluefishka: Sprite2D = get_tree().get_first_node_in_group("bluefishka")
@export var game_space: Array[Node2D]
var place: int = 0

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_click"):
		if game_space.is_empty():
			print("Ошибка: game_space пуст!")
			return
		
		var tween = create_tween()
		tween.tween_property(bluefishka, 'position', game_space[place].position, 1)

		place += 1
		if place >= game_space.size():  # Если дошли до конца массива, сбрасываем индекс
			place = 0
