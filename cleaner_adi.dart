import 'dart:io';

class ADIGraph {
  List<int> _relations = []; //Stores relationships between nodes in ADI format.
  List<String> _people = []; //Stores the data about each node.
  
  bool isInGraph({input: String}) => _people.contains(input);
  int nodeIndex({input: String}) => _people.indexOf(input);

  //Add a person to the social graph.
  void addPerson({name: String}){
    if (isInGraph(input: name)) {
      throw Exception;
    }
    else {
      _relations.add(0);
      _people.add(name); 
    };

  }
  
  //Make the connection between a given person and a list of friends. If the friends are not yet in the graph, add them to the end of the container.
  void connectFriends({name: String, friends: List}) {
    
    if (!isInGraph(input: name)) {
      print('$name not found, adding $name to graph.');
      this.addPerson(name: name);
    };

    for (int i = 0; i < friends.length; i++) {
      int n = nodeIndex(input: name);

      if (isInGraph(input: friends[i])) {
        int f = nodeIndex(input: friends[i]);
        _relations[n] |= (1 << f);
      } else {
        this.addPerson(name: friends[i]);
        int f = nodeIndex(input: friends[i]);
        _relations[n] |= (1 << f);
      };
    };
    
  }
  
  void printNodes(){
    for (String person in _people){
      stdout.writeln(person);
    };
  }
  //Remove a person from another person's friends list.

  //Remove a person from the social graph, updating all of their friends.

  //List all of the people in the social graph.

  //List a person's friends.
  

}

class Commands {
  void printPeople({graph: ADIGraph}){
    graph.printNodes();
  }

  void addToGraph({graph: ADIGraph}){
    String candidate;
    
    stdout.write('\nWho would you like to add to the graph?\nName: ');
    candidate = stdin.readLineSync();

    try{
      graph.addPerson(name: candidate);
    } catch (e) {
      stdout.write('$candidate is already a graph member.\n');
    };
    
  }
  
  void addRelationship(){
    //TODO
  }
  void removeFromGraph(){
    //TODO
  }
  void removeRelationship(){
    //TODO
  }
  void showMenu(){
    stdout.write('\n\'a\': Add someone to the graph. \n\'c\': Connect friends to graph member. \n\'p\': Print graph members. \n\'r\': Remove someone from the graph. \n\'u\': Unfriend one person from another. \n\'m\': View this menu. \n\'q\': Quit the program.\n\n');
  }
}

void main() {
  ADIGraph sanctum = new ADIGraph();
  Commands menu = new Commands();
  String command;

  while (command != 'q') {
  
  stdout.writeln('\n'+('-'*60));
  stdout.write('Welcome to the Social Graph. What would you like to do? \n(enter \'m\' to view the menu and \'q\' to quit): ');
  command = stdin.readLineSync();

  switch (command) {
    case 'a':
      menu.addToGraph(graph: sanctum);
      break;
    case 'c':
      menu.addRelationship();
      break;
    case 'm':
      menu.showMenu();
      break;
    case 'p':
      menu.printPeople(graph: sanctum);
      break;
    case 'r':
      menu.removeFromGraph();
      break;
    case 'u':
      menu.removeRelationship();
      break;
  }


  }
  /*
  List<String> roomies = ['Adelya', 'Alex', 'Andre', 'Arjun'];
  List<String> addysFriends = ['Eli', 'Steph', 'Rain', 'Alex'];
  
  for(String person in roomies){
    sanctum.addPerson(name: person);
  }
  
  sanctum.connectFriends(name: 'Adelya', friends: addysFriends);
  
  print(sanctum._people);
  print(sanctum._relations);
  print(sanctum._relations[0].toRadixString(2));
*/
}