Date::DATE_FORMATS[:br_date] = '%d/%m/%Y'
Date::DATE_FORMATS[:br_ordinal] = ->(date) { date.strftime("%A, %d de %B de %Y") }