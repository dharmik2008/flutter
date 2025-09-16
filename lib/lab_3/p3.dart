import 'dart:io';

class Friend
{
  String? name;
  int? age;
  String? phone;

  Friend(this.name,this.age,this.phone);
}
void main()
{
  Map<String,Friend> friends = {
    'heet':Friend('heet', 21,'1234567891'),
    'shivam':Friend('shivam',21,'1234567891'),
    'mohit':Friend('mohit',21,'1234567891'),
  };
  String serchName='shivam';

  if(friends.containsKey(serchName))
  {
    Friend f=friends[serchName]!;
    print('name is:${f.name}');
    print('age is:${f.age}');
    print('phone is:${f.phone}');
  }
  else
  {
    print('friend not found');
  }
}