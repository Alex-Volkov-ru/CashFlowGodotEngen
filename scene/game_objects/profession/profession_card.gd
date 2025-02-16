extends Control

@export var base_profession: BaseProfession

# Ссылки на элементы UI (Label для отображения данных)
@onready var profession_name_label: Label = $Panel/Label_ProfessionName  
@onready var salary_label: Label = $Panel/Label_Salary  
@onready var interest_label: Label = $Panel/Label_Interest  
@onready var dividends_label: Label = $Panel/Label_Dividends  
@onready var real_estate_label: Label = $Panel/Label_RealEstate  
@onready var business_label: Label = $Panel/Label_Business  
@onready var passive_income_label: Label = $Panel/Label_PassiveIncome  

# Расходы
@onready var taxes_label: Label = $Panel/Label_Taxes  
@onready var mortgage_label: Label = $Panel/Label_Mortgage  
@onready var education_loan_label: Label = $Panel/Label_EducationLoan  
@onready var car_loan_label: Label = $Panel/Label_CarLoan  
@onready var credit_card_debt_label: Label = $Panel/Label_CreditCardDebt  
@onready var small_loans_label: Label = $Panel/Label_SmallLoans  
@onready var other_expenses_label: Label = $Panel/Label_OtherExpenses  
@onready var children_expenses_label: Label = $Panel/Label_ChildrenExpenses  
@onready var total_expenses_label: Label = $Panel/Label_TotalExpenses  

# Общие финансы
@onready var total_income_label: Label = $Panel/Label_TotalIncome  
@onready var monthly_cashflow_label: Label = $Panel/Label_MonthlyCashflow  

# Активы
@onready var savings_label: Label = $Panel/Label_Savings  

# Пассивы (кредиты и долги)
@onready var mortgage_balance_label: Label = $Panel/Label_MortgageBalance  
@onready var education_loan_balance_label: Label = $Panel/Label_EducationLoanBalance  
@onready var car_loan_balance_label: Label = $Panel/Label_CarLoanBalance  
@onready var credit_card_debt_balance_label: Label = $Panel/Label_CreditCardDebtBalance  
@onready var small_loans_balance_label: Label = $Panel/Label_SmallLoansBalance  
@onready var bank_loans_label: Label = $Panel/Label_BankLoans  

# Расходы на детей
@onready var child_expense_per_kid_label: Label = $Panel/Label_ChildExpensePerKid  

# Новые метки для акций
@onready var stock_total_value_label: Label = $Panel/Label_StockTotalValue
@onready var stock_price_label: Label = $Panel/Label_StockPrice
@onready var stock_name_label: Label = $Panel/Label_StockName
@onready var stock_count_label: Label = $Panel/Label_StockCount

# Метки для отображения параметров недвижимости
@onready var real_estate_name_label: Label = $Panel/Label_RealEstateName
@onready var real_estate_price_label: Label = $Panel/Label_RealEstatePrice
@onready var real_estate_down_payment_label: Label = $Panel/Label_RealEstateDownPayment

# Метки для отображения параметров бизнеса
@onready var label_business_down_payment: Label = $Panel/Label_BusinessDownPayment
@onready var label_business_price: Label = $Panel/Label_BusinessPrice
@onready var label_business_assets: Label = $Panel/Label_BusinessAssets



func _ready() -> void:
	if base_profession != null:
		update_labels()  # Обновляем UI
	else:
		print("⚠ BaseProfession не был установлен!")

# Метод обновления всех данных
func update_labels():
	if base_profession == null:
		print("⚠ BaseProfession не инициализирован!")
		return
	
	# Обновляем все значения с использованием данных из base_profession
	profession_name_label.text = "Профессия: " + base_profession.profession_name
	salary_label.text = "Зарплата: $" + str(base_profession.salary)
	interest_label.text = "Проценты: $" + str(base_profession.interest)
	dividends_label.text = "Дивиденды: $" + str(base_profession.dividends)
	real_estate_label.text = "Доход от недвижимости: $" + str(base_profession.real_estate_income)
	business_label.text = "Доход от бизнеса: $" + str(base_profession.business_income)
	passive_income_label.text = "Пассивный доход: $" + str(base_profession.get_passive_income())

	taxes_label.text = "Налоги: $" + str(base_profession.taxes)
	mortgage_label.text = "Ипотека и аренда: $" + str(base_profession.mortgage_and_rent)
	education_loan_label.text = "Кредит на образование: $" + str(base_profession.education_loan)
	car_loan_label.text = "Кредит на машину: $" + str(base_profession.car_loan)
	credit_card_debt_label.text = "Кредитные карты: $" + str(base_profession.credit_card_debt)
	small_loans_label.text = "Мелкие кредиты: $" + str(base_profession.small_loans)
	other_expenses_label.text = "Прочие расходы: $" + str(base_profession.other_expenses)
	children_expenses_label.text = "Расходы на детей: $" + str(base_profession.children_expenses)
	total_expenses_label.text = "Общие расходы: $" + str(base_profession.get_total_expenses())

	total_income_label.text = "Общий доход: $" + str(base_profession.get_total_income())
	monthly_cashflow_label.text = "Месячный денежный поток: $" + str(base_profession.get_monthly_cashflow())

	savings_label.text = "Сбережения: $" + str(base_profession.savings)

	mortgage_balance_label.text = "Баланс ипотеки: $" + str(base_profession.mortgage_balance)
	education_loan_balance_label.text = "Баланс кредита на образование: $" + str(base_profession.education_loan_balance)
	car_loan_balance_label.text = "Баланс автокредита: $" + str(base_profession.car_loan_balance)
	credit_card_debt_balance_label.text = "Баланс по картам: $" + str(base_profession.credit_card_debt_balance)
	small_loans_balance_label.text = "Баланс по мелким кредитам: $" + str(base_profession.small_loans_balance)
	bank_loans_label.text = "Банковские кредиты: $" + str(base_profession.bank_loans)

	child_expense_per_kid_label.text = "Расходы на одного ребенка: $" + str(base_profession.child_expense_per_kid)

	# Обновление информации по акциям
	if base_profession.stocks_and_bonds.size() > 0:
		var total_stock_value = 0
		var stock_count = 0
		var stock_name = ""
		var stock_price = 0
		
		# Пробегаем по акциям
		for stock in base_profession.stocks_and_bonds:
			stock_name = stock.name
			stock_price = stock.price
			stock_count += stock.count
			total_stock_value += stock.price * stock.count

		stock_name_label.text = "Акции/Фонды/депозиты/Облигации \n" + stock_name
		stock_price_label.text = "Цена:\n $" + str(stock_price)
		stock_count_label.text = "Количество:\n" + str(stock_count)
		stock_total_value_label.text = "Сумма:\n$" + str(total_stock_value)
	else:
		# Если акций нет, устанавливаем пустые данные
		stock_name_label.text = "Акции/Фонды/депозиты/Облигации:\nНазвание"
		stock_price_label.text = "Цена:\n$0"
		stock_count_label.text = "Количество:\n0"
		stock_total_value_label.text = "Сумма:\n$0"
	
	# Обновление информации по недвижимости
	if base_profession.real_estate.size() > 0:
		var total_real_estate_value = 0
		var real_estate_name = ""
		var real_estate_price = 0
		var real_estate_down_payment = 0
		
		# Пробегаем по недвижимости
		for estate in base_profession.real_estate:
			real_estate_name = estate.name
			real_estate_price = estate.total_price
			real_estate_down_payment = estate.down_payment
			total_real_estate_value += estate.total_price

		# Обновляем метки для отображения параметров недвижимости
		real_estate_name_label.text = "Недвижимость:\n" + real_estate_name
		real_estate_price_label.text = "Цена:\n$" + str(real_estate_price)
		real_estate_down_payment_label.text = "Первый взнос:\n$" + str(real_estate_down_payment)

	else:
		# Если недвижимости нет, устанавливаем пустые данные
		real_estate_name_label.text = "Недвижимость:\nНазвание"
		real_estate_price_label.text = "Цена:\n$0"
		real_estate_down_payment_label.text = "Первый взнос:\n$0"
	
	# Обновление информации по бизнесу
	if base_profession.business.size() > 0:
		var total_business_value = 0
		var business_down_payment = 0
		var business_price = 0
		var business_assets = 0

		# Пробегаем по бизнесам
		for b in base_profession.business:
			business_down_payment = b.down_payment
			business_price = b.total_price
			business_assets = b.assets
			total_business_value += business_price

		# Обновляем метки для отображения параметров бизнеса
		label_business_down_payment.text = "Первый взнос:\n$" + str(business_down_payment)
		label_business_price.text = "Цена:\n$" + str(business_price)
		label_business_assets.text = "Бизнес\n" + str(business_assets)
	else:
		# Если бизнеса нет, устанавливаем пустые данные
		label_business_down_payment.text = "Первый взнос:\n$0"
		label_business_price.text = "Цена\n$0"
		label_business_assets.text = "Бизнес\nНазвание"
	
