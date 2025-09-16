import "dart:io";
void main(){
  print("enter element of string");
  int n = int.parse(stdin.readLineSync()!);
  List<String> number=[];
  for(int i = 0; i < n;i++) {
    print('enter string:${i + 1}:');
    String num=stdin.readLineSync()!;
    number.add(num);
  }
  print("list is: $number");
}