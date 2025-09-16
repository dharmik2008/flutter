import "dart:io";
void main() {
  print("Enter Then number of Element :");
  int a = int.parse(stdin.readLineSync()!);
  List<int> number = [];
  for (int i = 0; i < a; i++) {
    print("Enter Number ${i + 1}:");
    int num = int.parse(stdin.readLineSync()!);
    number.add(num);
  }
  print("list Is: $number");
}