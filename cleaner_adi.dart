import 'dart:io';

class ADIGraph {
  List<int> _relations = []; //Stores relationships between nodes in ADI format.
  List<String> _people = []; //Stores the data about each node.
  
  bool isInGraph({input: String}) => _people.contains(input);
  int nodeIndex({input: String}) => _people.indexOf(input);

  //Add a person to the social graph.
  void addPerson({name: String}){
    if (isInGraph(input: name)) {
      print('$name is already in the graph.');
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
  
  //Remove a person from another person's friends list.

  //Remove a person from the social graph, updating all of their friends.

  //List all of the people in the social graph.

  //List a person's friends.
  

}

void main() {
  ADIGraph sanctum = new ADIGraph();
  String command;

  while (command != 'q') {
  
  stdout.write('Welcome to the Social Graph. What would you like to do? \n(press \'l\' to list, \'a\' to add, \'r\' to remove, \'q\' to quit): ');
  command = stdin.readLineSync();

  

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