import 'dart:io';

/*
  Encapsulates the data model for the program.
*/
class ADIGraph {
  List<int> _relations = []; //Stores relationships between nodes as Adjacency Descriptive Integers.
  List<String> _data = []; //Stores the data about each node.
  
  bool isInGraph({input: String}) => _data.contains(input);
  int nodeIndex({input: String}) => _data.indexOf(input);

  /*
    Add a node to the graph.
  */
  void addNode({name: String}) {
    if (isInGraph(input: name)) {
      throw Exception;
    }
    else {
      _relations.add(0);
      _data.add(name); 
    };
  }
  
  /*
    Connect a node with and a list of other nodes. 
    If the connecting nodes are not yet in the graph, 
    add them to the end of the container.
  */
  void connectNodes({data: String, nodes: List}) {
    //If the subject data is not in the graph, add it.
    if (!isInGraph(input: data)) {
      stdout.writeln('$data not found, adding $data to graph.');
      this.addNode(name: data);
    };

    //Make the connection using the magic of ADIs.
    for (int i = 0; i < nodes.length; i++) {
      int n = nodeIndex(input: data);
      if (isInGraph(input: nodes[i])) {
        int f = nodeIndex(input: nodes[i]);
        _relations[n] |= (1 << f);
      } else {
        this.addNode(name: nodes[i]);
        int f = nodeIndex(input: nodes[i]);
        _relations[n] |= (1 << f);
      };
    };
  }
  
  /*
    Print all nodes in the graph, in order of addition.
  */
  void printNodes(){
    for (String datum in _data){
      stdout.writeln(datum);
    };
  }

  /*
    List nodes that share an edge with a given node.
  */
  void listConnections({node: String}) {
    if(isInGraph(input: node)) {
      int r = _relations[nodeIndex(input: node)];
      for (int i = 0; i < _data.length; i++) {
        if ((r & (1 << i)) != 0) {
          stdout.writeln(_data[i]);
        };
      };
      stdout.writeln();
    } else {
      throw Exception;
    };
  }
  
} // END class ADIGraph

/*
  Encapsulates the controller of the program.
*/
class Commands {
  void printPeople({graph: ADIGraph}){
    graph.printNodes();
  }

  void addToGraph({graph: ADIGraph}){
    String candidate;
    
    stdout.write('\nWho would you like to add to the graph?\nName: ');
    candidate = stdin.readLineSync();

    try{
      graph.addNode(name: candidate);
    } catch (e) {
      stdout.write('$candidate is already a graph member.\n');
    };
    
  }

  void addRelationships({graph: ADIGraph}){
    stdout.write('\nWhose friends are these? ');
    String subject = stdin.readLineSync();

    stdout.write('Please enter a friend\'s name: ');
    List<String> group = [];
    String friend = stdin.readLineSync();
    group.add(friend);
    bool flag = true;
    while (flag) {
      stdout.write('Enter the next friend\'s name (press Enter to finish): ');
      friend = stdin.readLineSync();
      if (friend.isNotEmpty) {
        group.add(friend);
      } else {
        flag = false;
      };
    };

    graph.connectNodes(data: subject, nodes: group);
    stdout.write('Done!\n');
  }

  void printFriends({graph: ADIGraph}) {
    stdout.writeln('\nWhose friends do you want to see? ');
    String subject = stdin.readLineSync();
    try {
      stdout.writeln('$subject\'s friends are:');
      graph.listConnections(node: subject);
    } catch (e) {
      stdout.writeln('Error: $subject is not part of the graph.');
    };
  }

  void showMenu(){
    stdout.write('\n\'a\': Add someone to the graph. \n\'c\': Connect friends to graph member. \n\'f\': Print someone\'s friend list. \n\'p\': Print graph members. \n\'m\': View this menu. \n\'q\': Quit the program.\n\n');
  }

} //END class Commands

void RunProgram({input: Object}){
  Commands menu = new Commands();
  String command;

  while (command != 'q') {
  
    stdout.writeln('\n'+('-'*60));
    stdout.write('Welcome to the Social Graph. What would you like to do? \n(enter \'m\' to view the menu and \'q\' to quit): ');
    command = stdin.readLineSync();

    switch (command) {
      case 'a':
        menu.addToGraph(graph: input);
        break;
      case 'c':
        menu.addRelationships(graph: input);
        break;
      case 'f':
        menu.printFriends(graph: input);
        break;
      case 'm':
        menu.showMenu();
        break;
      case 'p':
        menu.printPeople(graph: input);
        break;
    };
  };
}

void main() {
  ADIGraph social_graph = new ADIGraph();

  RunProgram(input: social_graph);
}