class AddingAnAnimalException(Exception):

     def __init__(self):
         super().__init__(f"Ошибка при добавлении нового живтного")
