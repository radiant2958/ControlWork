from abc import ABC, abstractmethod


class Animal(ABC):
    _next_id = 1
    def __init__(self, name, birthday, commands):
        self.__id_animal = Animal._next_id
        self.__name = name
        self.__birthday = birthday
        self.__commands = commands
        Animal._next_id +=1

    def add_command(self, new_command):
        self.__commands.append(new_command)

    def get_id_animal(self):
        return self.__id_animal

    def get_name(self):
        return self.__name

    def get_birthday(self):
        return self.__birthday

    def get_commands(self):
        return self.__commands


    def __str__(self):
        return f"Animal '{self.get_name()}', birthdate {self.get_birthday()}, know commands: {', '.join(self.get_commands())}"