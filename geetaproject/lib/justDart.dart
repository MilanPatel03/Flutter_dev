
void main() {
  print(sumupEvens([223,43,45,66,77,4,4,2,2,22]));

  Map<String,dynamic> userMap = {"name": "alex", "age": 25, "email": "abcd1234@gmail.com", "isLogin": true};

  getNameandAgefromMap(userMap);
  print(getFrequency("flutter"));
}

int sumupEvens(List<int> nums){
  List<int> evens = nums.where((n) => n%2 == 0).toList();
  int sumUp = evens.fold(1, (a,b) => a+b);
  return sumUp;
}

getNameandAgefromMap(Map<String,dynamic> funData){
  String name  = funData["name"];
  int age = funData["age"];
  bool isloginOrnot = funData["isLogin"];

  print("$name,\n$age,\n$isloginOrnot");
}

Map<String, int> getFrequency(String s){

  Map<String,int> freq = {};
  for(var l in s.split('')){
    freq[l] = (freq[l] ?? 0) + 1;
  }
  return freq;
}

