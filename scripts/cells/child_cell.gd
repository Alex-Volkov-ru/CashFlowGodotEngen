extends "res://scripts/cells/base_cell.gd"  # Наследуем от базового класса

func _ready():
	cell_type = "Ребёнок"  # Устанавливаем тип клетки как 
	#$Background.color = Color(0, 0.6, 1)  # Устанавливаем цвет фона (голубой)
	update_label()  # Обновляем текст клетки с учётом нового типа

# Логика для клетки
func activate(player):
	print(player.name + " Увас появился ребёнок!")
	# Здесь можно добавить любую уникальную логику для "Возможности"
