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