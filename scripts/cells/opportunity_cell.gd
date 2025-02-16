extends "res://scripts/cells/base_cell.gd"  # Наследуем от базового класса


func _ready():
	cell_type = "Возможность"  # Устанавливаем тип клетки как "Возможность"
	#$Background.color = Color(0, 0.6, 1)  # Устанавливаем цвет фона (голубой)
	update_label()  # Обновляем текст клетки с учётом нового типа


# Логика для клетки "Возможность"
func activate(player):
	print(player.name + " получил возможность!")
	# Здесь можно добавить любую уникальную логику для "Возможности"
