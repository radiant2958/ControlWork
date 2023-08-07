class FileLoadException(Exception):
    def __init__(self, file_name):
        super().__init__(f"Файл {file_name} не найден.")