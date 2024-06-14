class Car {
  String brand;
  String model;
  int year;
  double milesDriven;

  // Static property to track number of Car objects created
  static int numberOfCars = 0;

  // Constructor
  Car(this.brand, this.model, this.year, this.milesDriven) {
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    int currentYear = DateTime.now().year;
    return currentYear - year;
  }
}

void main() {
  Car car1 = Car('Toyota', 'Camry', 2015, 50000);
  Car car2 = Car('Honda', 'Civic', 2018, 30000);
  Car car3 = Car('Ford', 'Mustang', 2020, 15000);

  car1.drive(120);
  car2.drive(250);
  car3.drive(75);

  print(
      'Car 1: ${car1.getBrand()} ${car1.getModel()}, Year: ${car1.getYear()}, Miles Driven: ${car1.getMilesDriven()}, Age: ${car1.getAge()} years');
  print(
      'Car 2: ${car2.getBrand()} ${car2.getModel()}, Year: ${car2.getYear()}, Miles Driven: ${car2.getMilesDriven()}, Age: ${car2.getAge()} years');
  print(
      'Car 3: ${car3.getBrand()} ${car3.getModel()}, Year: ${car3.getYear()}, Miles Driven: ${car3.getMilesDriven()}, Age: ${car3.getAge()} years');

  print('Total number of cars created: ${Car.numberOfCars}');
}
