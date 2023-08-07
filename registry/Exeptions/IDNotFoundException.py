class IDNotFoundException(Exception):
    def __init__(self, id):
        super().__init__(f"ID {id} не найден в реестре")