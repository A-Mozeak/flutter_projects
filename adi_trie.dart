/*
NODE BASED, GENERIC IMPLEMENTATION

class ADINode<E> {
  E _data;
  int _relations;
  
  ADINode(E datum){
    this._data = datum;
    this._relations = 0;
  }
  
  E getData() => this._data;
  void setData(E datum) => this._data = datum;
  
  int getRelations() => this._relations;
  void setRelations(int relation) => this._relations |= relation;
}

class ADIGraph {
  List<ADINode<String>> nodes;
  
  void addPerson({name: String}){
    int duplicates = 0;
    nodes.forEach((node){
      node.getData() == name ? duplicates++ : null; 
    });
    duplicates > 0 ? print('$name is already in the graph.') : nodes.add(ADINode(name));
  }
  
  void connectFriends({name: String, friends: List}){
    friends.forEach((friend){
      
    })
}
*/
class ADIGraph {
  List<int> relations = [];
  List<String> people = [];
  
  void addPerson({name: String}){
    if(people.contains(name)){
      print('$name is already in the graph.');
    }
    else{
      relations.add(0);
      people.add(name); 
    }
  }
  
  void connectFriends({name: String, friends: List}){
    if(!people.contains(name)){
      print('$name not found, adding $name to graph.');
      this.addPerson(name: name);
    }
    for(int i = 0; i < friends.length; i++){
      if(people.contains(friends[i])){
        int friendPosition = (1<<people.indexOf(friends[i]));
        relations[people.indexOf(name)] |= friendPosition;
      } else {
        this.addPerson(name: friends[i]);
        int friendPosition = 1<<people.indexOf(friends[i]);
        relations[people.indexOf(name)] |= friendPosition;
      }
    }
  }
  
}

void main() {
  ADIGraph sanctum = new ADIGraph();
  
  List<String> roomies = ['Adelya', 'Alex', 'Andre', 'Arjun'];
  List<String> addysFriends = ['Eli', 'Steph', 'Rain', 'Alex'];
  
  for(String person in roomies){
    sanctum.addPerson(name: person);
  }
  
  sanctum.connectFriends(name: 'Adelya', friends: addysFriends);
  
  print(sanctum.people);
  print(sanctum.relations);
  print(sanctum.relations[0].toRadixString(2));

}