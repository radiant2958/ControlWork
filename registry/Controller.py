
from Model import model, Counter
from View import View
from Exeptions import AddingAnAnimalException

def start():

    counter = Counter.Counter()
    my_animal = {}
    while True:
        View.display_menu()  
        handler(int(View.get_choice()), counter,my_animal)
           

def handler(n: int, counter: Counter.Counter,my_animal):
    match n:
        case 0:
            my_animal, counter=model.load_animals(View.open_registry())
            View.print_counter(counter)
            
        case 1:
            try:
                model.add_new_animal(my_animal, *View.get_animal_details())
                counter.add(1)
                View.print_counter(counter)
            except AddingAnAnimalException.AddingAnAnimalException:
                raise AddingAnAnimalException.AddingAnAnimalException()

        case 2:

            View.print_animal_details(*model.identify_animal(my_animal, View.input_id()))
        case 3:

            model.new_commands(my_animal, View.input_id(), View.new_command())
            View.lesson_command()

        case 4:
            View.print_commands(model.commands_animal(my_animal, View.input_id()))

        case 5:
            View.show_all_animals(my_animal)

        case 6:
            model.delete_animal(my_animal, View.input_id())
            counter.add(-1)
            View.del_animal()
            View.print_counter(counter)

        case 7:
            model.save_animals(View.exit_registry(), my_animal)
            View.print_exit()
            exit()
         

    return False