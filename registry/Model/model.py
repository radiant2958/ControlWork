from . import Dogs, Cats, Hamsters, Horses, Donkeys, Camels, Pet
from .Animal import Animal
from Exeptions import IDNotFoundException, FileLoadException, FileSaveException
from .Counter import Counter
from datetime import datetime

def add_new_animal(my_animal,type_animal, name, birthday, commands):
    match(type_animal):
        case "dog":
            animal = Dogs.Dogs(name, birthday, commands)
            my_animal[animal.get_id_animal()] = animal
        case "cat":
            animal = Cats.Cats(name, birthday, commands)
            my_animal[animal.get_id_animal()] = animal
        case "hamster":
            animal = Hamsters.Hamsters(name, birthday, commands)
            my_animal[animal.get_id_animal()] = animal
        case "horse":
            animal =  Horses.Horses(name, birthday, commands)
            my_animal[animal.get_id_animal()] = animal
        case "donkey":
            animal = Donkeys.Donkeys(name, birthday, commands)
            my_animal[animal.get_id_animal()] = animal
        case "camel":
            animal = Camels.Camels(name, birthday, commands)
            my_animal[animal.get_id_animal()] = animal


def load_animals(file_name):
    my_animals = {}
    counter = Counter()
    try:
        with open(file_name, 'r') as file:
            for line in file:
                parts = line.strip().split(',')
                match(parts[1]):
                            case "Dogs":
                                birthday = datetime.strptime(parts[3], '%d-%m-%Y')
                                animal = Dogs.Dogs(str(parts[2]), birthday,parts[4].split(", ") )
                                my_animals[animal.get_id_animal()] = animal
                                print(f"Animal with ID {animal.get_id_animal()} added. Current my_animals: {my_animals}")
                            case "Cats":
                                birthday = datetime.strptime(parts[3], '%d-%m-%Y')
                                animal = Cats.Cats(parts[2], birthday, parts[4].split(", "))
                                my_animals[animal.get_id_animal()] = animal
                            case "Hamsters":
                                birthday = datetime.strptime(parts[3], '%d-%m-%Y')
                                animal = Hamsters.Hamsters(parts[2], birthday, parts[4].split(", "))
                                my_animals[animal.get_id_animal()] = animal
                            case "Horses":
                                birthday = datetime.strptime(parts[3], '%d-%m-%Y')
                                animal =  Horses.Horses(parts[2], birthday, parts[4].split(", "))
                                my_animals[animal.get_id_animal()] = animal
                            case "Donkeys":
                                birthday = datetime.strptime(parts[3], '%d-%m-%Y')
                                animal = Donkeys.Donkeys(parts[2], birthday, parts[4].split(", "))
                                my_animals[animal.get_id_animal()] = animal
                            case "Camels":
                                birthday = datetime.strptime(parts[3], '%d-%m-%Y')
                                animal = Camels.Camels(parts[2], birthday, parts[4].split(", "))
                                my_animals[animal.get_id_animal()] = animal
                counter.add(1)
           
            return my_animals, counter
    except FileLoadException.FileLoadException:
        raise FileLoadException.FileLoadException(file_name)

def save_animals(file_name, animals):
    try:
        with open(file_name, 'w') as file:
            for id_animal, animal in animals.items():
                commands = ','.join(animal.get_commands())
                animal_type = type(animal).__name__
                line = f"{id_animal},{animal_type},{animal.get_name()},{animal.get_birthday()},{commands}\n"
                file.write(line)
    except FileSaveException.FileSaveException:
        raise FileSaveException.FileSaveException(file_name)



def commands_animal ( my_animal, id):
    commands = []
    id=int(id)
    try:
        if id in my_animal.keys():
            animal = my_animal[id]
            commands = animal.get_commands()
            return commands
    except IDNotFoundException.IDNotFoundException:
        raise IDNotFoundException.IDNotFoundException(id)




def delete_animal(my_animal, id):
    id = int(id)
    if id not in my_animal.keys():
        raise IDNotFoundException.IDNotFoundException(id)
    my_animal.pop(id)


def new_commands(my_animal, id, new_command):
    id = int(id)
    try:
        if id in my_animal.keys():
            animal = my_animal[id]
            animal.add_command(new_command)
    except IDNotFoundException.IDNotFoundException:
        raise IDNotFoundException.IDNotFoundException(id)

def identify_animal(my_animal, id):
    id = int(id)
    try:
        animal = my_animal[id]
        animal_type = type(animal).__name__
        name = animal.get_name()
        birthday = animal.get_birthday()
        commands = animal.get_commands()
        return animal_type, name, birthday, commands
    except IDNotFoundException.IDNotFoundException:
        raise IDNotFoundException.IDNotFoundException(id)




