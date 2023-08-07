class FileSaveException(Exception):

    def __init__(self, file_name):
        super().__init__(f"Ошибка при сохранении файла {file_name}.")