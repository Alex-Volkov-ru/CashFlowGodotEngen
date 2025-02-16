extends Resource

class_name BaseProfession  # Создаём класс BaseProfession, который можно использовать как ресурс

# 📌 Параметры профессии
@export var profession_name: String = "Неизвестная профессия"  # Название профессии
@export var salary: int = 0  # Основной доход (зарплата)
@export var interest: int = 0  # Доход от процентов по вкладам
@export var dividends: int = 0  # Доход от дивидендов (акции)
@export var real_estate_income: int = 0  # Доход от недвижимости (аренда)
@export var business_income: int = 0  # Доход от бизнеса

# 📌 Расходы
@export var taxes: int = 0  # Налоги
@export var mortgage_and_rent: int = 0  # Ипотека и аренда жилья
@export var education_loan: int = 0  # Выплаты по кредиту на образование
@export var car_loan: int = 0  # Кредит на машину
@export var credit_card_debt: int = 0  # Долги по кредитным картам
@export var small_loans: int = 0  # Прочие мелкие кредиты
@export var other_expenses: int = 0  # Прочие личные расходы
@export var children_expenses: int = 0  # Расходы на детей
@export var child_expense_per_kid: int = 0  # Расход на одного ребенка

# 📌 Активы (имущество и инвестиции)
@export var savings: int = 0  # Накопления
@export var stocks_and_bonds: Array = []  # Массив акций и облигаций (каждый элемент - словарь с инфой)
@export var real_estate: Array = []  # Массив недвижимости (каждый элемент - словарь)
@export var business: Array = []  # Массив бизнеса (каждый элемент - словарь)

# 📌 Пассивы (долги и кредиты)
@export var mortgage_balance: int = 0  # Остаток долга по ипотеке
@export var education_loan_balance: int = 0  # Остаток долга по кредиту на образование
@export var car_loan_balance: int = 0  # Остаток долга по автокредиту
@export var credit_card_debt_balance: int = 0  # Задолженность по кредитным картам
@export var small_loans_balance: int = 0  # Остаток мелких кредитов
@export var bank_loans: int = 0  # Прочие банковские кредиты

# 📌 Методы расчёта финансов
func get_passive_income() -> int:
	return interest + dividends + real_estate_income + business_income

func get_total_income() -> int:
	return salary + get_passive_income()

func get_total_expenses() -> int:
	return taxes + mortgage_and_rent + education_loan + car_loan + credit_card_debt + small_loans + other_expenses + children_expenses

func get_monthly_cashflow() -> int:
	return get_total_income() - get_total_expenses()
