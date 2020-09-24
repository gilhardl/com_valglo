import 'package:comvalglo/data/person.dart';

class PersonsRepository {
  final List<Person> persons = [
    Person(
      lastname: 'GILHARD',
      firstname: 'Léo',
      age: 19,
      location: 'Pierrelatte (26)',
      picture: 'leo.png',
      presentation:
          'Je suis plein de vie et toujours de bonne humeur. Le rugby me passionne, d’ailleurs j’en fait depuis 14 ans, cela m’a amené à être sportif de haut niveau. J’abandonne jamais et je donne toujours tout.',
    ),
    Person(
      lastname: 'Gagnère',
      firstname: 'Oriane',
      age: 19,
      location: 'Saint-Cyr (07)',
      picture: 'oriane.png',
      presentation:
          'Je suis une personne créative, dynamique et souriante qui est passionnée de danse et de mode. Je suis déterminée dans le travail que j’entreprends. J’aime faire des activités diverses et avoir des journées variées.',
    ),
    Person(
      lastname: 'Betton',
      firstname: 'Elise',
      age: 18,
      location: 'Tournon-sur-Rhône (07)',
      picture: 'elise.png',
      presentation:
          'Je suis une personne organisée, rigoureuse et souvent de bonne humeur. Je suis passionnée de sport en général et plus particulièrement de rugby. Je suis compétitrice avec une âme de gagnante. Perfectionniste, je me donne à fond dans tout ce que j’entreprend.',
    ),
    Person(
      lastname: 'Buge',
      firstname: 'Baptiste',
      age: 19,
      location: 'Dolomieu (38)',
      picture: 'baptiste.png',
      presentation:
          'Je suis une personne aimable, qui aime partager la vie avec mes amis. Je vais toujours de l’avant malgré les difficultés, cela m’aide énormément aussi bien au travail qu’au rugby car je suis sportif de haut niveau. Je partage ainsi des valeurs qui m’aident à grandir et à évoluer vers les autres.',
    ),
    Person(
      lastname: 'Gardon',
      firstname: 'Sarah',
      age: 19,
      location: 'Larnage (26)',
      picture: 'sarah.png',
      presentation:
          'Je suis quelqu’un de très organisée et dynamique. Généreuse, je suis toujours là pour aider les autres. Je suis passionnée de cuisine, notamment de pâtisserie. J’aime pratiquer la boxe, car cela me permet de toujours me dépasser.',
    ),
  ];
}
