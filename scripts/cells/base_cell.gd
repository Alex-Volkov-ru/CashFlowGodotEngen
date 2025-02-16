extends Node2D
class_name BaseCell

@onready var label = $Background/Label
@onready var move_point = $MovePoint  # Получаем Marker2D для точки перемещения

var cell_type: String = "Base"  # Тип клетки (по умолчанию базовый)

# Функция для получения позиции MovePoint
func get_move_position() -> Vector2:
	return move_point.global_position  # Возвращаем глобальные координаты MovePoint

# Метод для обновления текста на клетке
func update_label():
	if label:
		label.text = cell_type  # Устанавливаем текст
	else:
		print("Ошибка: Label не найден!")

# Логика активации клетки
func activate(player):
	print(player.name + " попал на клетку " + cell_type)
	# Можешь добавить общую логику активации клетки, если нужно
