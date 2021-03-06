class Person {
  const Person({
    this.lastname,
    this.firstname,
    this.age,
    this.location,
    this.picture,
    this.presentation,
  });

  final String lastname;
  final String firstname;
  final int age;
  final String location;
  final String picture;
  final String presentation;

  String get name => '$firstname $lastname';

  String toString() =>
      'Person { lastname: $lastname, firstname: $firstname, age: $age, location: $location, picture: $picture, presentation: $presentation }';
}
