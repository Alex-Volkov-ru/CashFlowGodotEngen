extends "res://scripts/cells/base_cell.gd"  # Наследуемся от BaseCell

func _ready():
	cell_type = "Всякая всячина"  # Устанавливаем тип клетки
	#$Background.color = Color(1, 0.5, 0)  # Например, оранжевый цвет
	update_label()  # Обновляем текст клетки

# Логика для клетки "Всякая всячина"
func activate(player):
	print(player.name + " попал на клетку Всякая всячина!")
	# Здесь можно добавить случайные события, бонусы или штрафы
