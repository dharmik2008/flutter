import "dart:io";
void main() {
  print("Enter Then number of Element :");
  int a = int.parse(stdin.readLineSync()!);
  List<int> number=[];
  for(int i=0;i<a;i++){
    print("Enter Number ${i+1}:");
    int num=int.parse(stdin.readLineSync()!);
    number.add(num);
  }
  int evenco = 0;
  int oddco = 0;

  for(int i in number){
    if(i%2==0){
      evenco++;
    }
    else{
      oddco++;
    }
  }
  print("Numbe of Even Number : $evenco");
  print("Numbe of Odd Number : $oddco");
}