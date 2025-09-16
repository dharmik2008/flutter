import "dart:io";
void main(){
  print("enter the number of element");
  int n = int.parse(stdin.readLineSync()!);
  List<int> number = [];
  for (int i = 0; i < n; i++)
  {
    print("enter number ${i + 1}: ");
    int num=int.parse(stdin.readLineSync()!);
    number.add(num);
  }
  for(int i=0;i<number.length-1;i++){
    for(int j=0;j<number.length-i-1;j++){
      if(number[j]>number[j+i]){
        int temp = number[j];
        number[j]=number[j+i];
        number[j+i]=temp;
      }
    }
  }
  print('list is: $number');
}