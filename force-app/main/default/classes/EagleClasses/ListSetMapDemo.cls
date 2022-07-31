//List is Ordered Collection - not duplicate values
public class ListSetMapDemo {
    public void demoList() {
        List<Integer> countOfTen = new List<Integer>();
        countOfTen.add(10);
        countOfTen.add(20);
        countOfTen.add(30);
        countOfTen.add(40);
        countOfTen.add(50);
        system.System.debug(('List: ')+ countOfTen);
        system.System.debug(('Index3: ')+ countOfTen.get(3));

    }

    //Set is unordered collection - Duplicate Values
    public void demoSet(){
        set<String> avengersSet = new set<String>();
        avengersSet.add('Iron Man');
        avengersSet.add('Spider Man');
        avengersSet.add('Hulk');
        avengersSet.add('Captain America');
        avengersSet.add('Loki');
        system.debug('Set: '+ avengersSet);
        system.debug('SIze: '+ avengersSet.size());

    }

    //Maps are you are assigning particular value to each key. Function Table (Key, Value)

    public void demoMaps(){
        Map<String,String> fruitsMap = new Map<String,String>();
        fruitsMap.put('First','Apple');
        fruitsMap.put('Second','Orange');
        fruitsMap.put('Third','Grape');
        system.debug('Map: '+ fruitsMap);
        system.debug('Value of second: '+ fruitsMap.get('Second'));
        system.debug('Keys of the Map: '+ fruitsMap.keySet());
        system.debug('Values of the Map: '+ fruitsMap.values());
    }



}