import 'dart:io';

class Car {
  final String type;
  final String model;
  final int year;
  final String color;
  final String condition;
  final int price;
  Car(this.type, this.model, this.year, this.color, this.condition, this.price);
}
class CarDatabase {
  List<Car> cars = [];

  CarDatabase() {
    // database sem hægt er að leita í
    _initializeDatabase();
  }
  void _initializeDatabase() {
    cars.addAll([
      Car('Land Rover', 'Discovery', 2019, 'Svartur', 'Notaður', 500000),
      Car('Land Rover', 'Range Rover', 2020, 'Hvítur', 'Nýr', 800000),
      Car('Land Rover', 'Evoque', 2021, 'Silvur', 'Notaður', 600000),

      Car('Polestar', '1', 2021, 'Blár', 'Nýr', 600000),
      Car('Polestar', '2', 2022, 'Svartur', 'Nýr', 700000),
      Car('Polestar', 'XC40', 2023, 'Rauður', 'Notaður', 550000),

      Car('Jaguar', 'XE', 2020, 'Grænn', 'Notaður', 450000),
      Car('Jaguar', 'F-Pace', 2022, 'Grár', 'Nýr', 750000),
      Car('Jaguar', 'I-Pace', 2023, 'Fjólublár', 'Nýr', 850000),

      Car('Subaru', 'Impreza', 2019, 'Rauður', 'Notaður', 300000),
      Car('Subaru', 'Forester', 2020, 'Blár', 'Notaður', 350000),
      Car('Subaru', 'Outback', 2021, 'Svartur', 'Nýr', 400000),

      Car('Mercedes','C-Class',2020,'Silver','Notaður',3200000),
      Car('Mercedes','E-Class',2021,'Svartur','Nýr',5400000),
      Car('Mercedes','GLC',2022,'Hvítur','Nýr',6000000),
    ]);
  }
  List<Car> search(String keyword) {
    return cars
        .where((car) =>
    car.type.toLowerCase().contains(keyword.toLowerCase()) ||
        car.model.toLowerCase().contains(keyword.toLowerCase()) ||
        car.year.toString().contains(keyword.toLowerCase()) ||
        car.color.toLowerCase().contains(keyword.toLowerCase()) ||
        car.condition.toLowerCase().contains(keyword.toLowerCase()) ||
        car.price.toString().contains(keyword.toLowerCase()))
        .toList();
  }
  List<Car> listAll() {
    return cars;
  }
}
void main() {
  final database = CarDatabase();
  print ('Velkomin í bílasölu Dóra Bílar til sölu eru:');
  print ('-----');
  print ('Land Rover');
  print ('-----');
  print ('Polestar');
  print ('-----');
  print ('Jaguar');
  print ('-----');
  print ('Subaru');
  print ('-----');
  print ('Mercedes');
  print ('-------------');
  while (true) {
    stdout.write('Skrifaðu leitarorð til að finna sérstakan bíl/árgerð eða ýttu á Enter til að sjá alla bíla: ');
    String input = stdin.readLineSync()!;
    if (input.toLowerCase() == 'quit') {
      print('Leitarvél lokað');
      break;
    } else if (input.toLowerCase() == 'list') {
      print('Listi yfir alla bíla:');
      for (var car in database.listAll()) {
        print('${car.type} ${car.model} (${car.year}), Litur: ${car.color}, Ástand: ${car.condition}, Verð: ${car.price}-kr');
      }
      continue;
    }
    List<Car> results = database.search(input);
    if (results.isNotEmpty) {
      print('Niðurstöður:');
      for (var car in results) {
        print('${car.type} ${car.model} (${car.year}), Litur: ${car.color}, Ástand: ${car.condition}, Verð: ${car.price}-kr');
      }
    } else {
      print('Engir bílar fundust.');
    }
  }
}