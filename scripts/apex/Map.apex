List<String>SinifListeleri1= new List<String>{'Ali','Adem','Mary','John'};//1a sinifi
List<String>SinifListeleri2= new List<String>{'Liz','Kari','Veli','John'};//1b sinifi

Map<String,List<String>> mapOfList= new Map<String,List<String>>();

mapOfList.put('1A', SinifListeleri1);
mapOfList.put('1B', SinifListeleri2);
system.System.debug('Map of List: '+mapOfList);
system.debug('Map keys: '+mapOfList.keySet());
system.debug('Map values: '+mapOfList.values());
system.debug('1B sinifi: '+mapOfList.get('1B'));


List<String> myList= mapOfList.get('1B');
system.debug('Veli '+ myList.get(2));


//PrintNumbers.printTheOdds(3, 80);
List<Integer> myOddList=PrintNumbers.printTheOdds(5, 15);
System.debug('My Odd List: ' + myOddList);