from Exeptions import InvalidInputException
from datetime import datetime
def display_menu():
    print("\n0. Для начала работы в реестре откройте его ")
    print("1. Добавить животное")
    print("2. Индентифицировать животное по id ")
    print("3. Научить животное новой команде")
    print("4. Показать список команд, которые знает животное")
    print("5. Показать весь реестр животных")
    print("6. Удалить животное ")
    print("7. Выход")

def get_choice():
    n = input("Сделайте выбор: ")
    if not n.isdigit():
        raise InvalidInputException.InvalidInputException("Вы должны ввести цифру пункта меню")
    return n

def open_registry():
    file_name = input("Введите имя файла:  ")
    return file_name

def exit_registry():
    print('Перед выходом сохраним реестр, введите имя как бы вы хотели его сохранить: ')
    file_name = input("Введите имя файла:  ")
    return file_name

def get_animal_details():
    type_animal = input("Введите тип животного: ")
    if not type_animal.isalpha():
        raise InvalidInputException.InvalidInputException("Тип животного должен содержать только буквы.")

    name = input("Введите имя: ")
    if not name.isalpha():
        raise InvalidInputException.InvalidInputException("Имя должно содержать только буквы.")

    birthday = input("Введите дату рождения (дд-мм-гггг): ")
    try:
        datetime.strptime(birthday, '%d-%m-%Y')
    except ValueError:
        raise InvalidInputException.InvalidInputException("Дата рождения должна быть в формате дд-мм-гггг.")

    commands = input("Введите команды через знак ',': ").split(',')
    if not all(c.isalpha() or c.isspace() for command in commands for c in command):

        raise InvalidInputException.InvalidInputException("Команды должны содержать только буквы.")

    return type_animal, name, birthday, commands

def print_animal_details(animal_type, name, birthday, commands):
    print(f"Тип животного: {animal_type}")
    print(f"Имя: {name}")
    print(f"Дата рождения: {birthday}")
    print(f"Команды: {', '.join(commands)}")

def input_id():
    try:
        id_animal = input("Введите номер id животного : ")
        if  id_animal.isdigit():
            return id_animal
    except InvalidInputException.InvalidInputException:
        raise InvalidInputException.InvalidInputException("Id должен состоять только из цифр.")


def notify_registry_not_opened():
    print("Реестр не открыт. Пожалуйста, сначала откройте реестр.")

def lesson_command():
    print("Животное знает новую комманду")
def new_command():
    command = input("Введите команду: ")
    if not command.isalpha():
        raise InvalidInputException.InvalidInputException("Команда должна содержать только буквы.")
    return  command

def del_animal():
    print('Животное удалено')

def print_commands(commands):
    print(f"Животное знает вот такие комманды: {commands}")

def print_exit():
    print("Пока!")

def show_all_animals(my_animal):
    for k, v in my_animal.items():
        print(f"id: {k}. animal: {v}")

def print_counter(counter):
    print(f"Колличество животных в реестре равно: {counter.value}")

