public class DemoForLoop {
    
    public void demoInitialization(){
        for(Integer i=0; i<10; i++){
        	system.debug('Print i: '+i);   
            
        }
        
    }
    
    
	//All the odd numbers- math.mod(10,4)-%
	 public void demoOdd(Integer startVal, Integer endVal){
        for(Integer i=startVal; i<=endVal; i++){
            Integer modValue = math.mod(i,2);
            if(modValue==1)
        	system.debug('Print odd: '+i);   
            
        }
     } 
    
    public void multpTable(Integer input){
        for(Integer i=1; i<=10; i++){
            Integer multply= i*input;
            system.debug(i +'*'+ input+ '=' + multply);
        }
    }
    
    public void demoItereteList(){
        List<String> namesList = new List<String>();
        namesList.add('Busra');
        namesList.add('Yusuf');
        namesList.add('Seda');
        namesList.add('Amy');
        namesList.add('Tugba');
        namesList.add('Bahar');
        system.debug('Print List: '+ namesList);
        
        for(String nameValue : namesList){
            system.debug('Values inside the list:name '+ nameValue);
        }
        
    }
    
    public void demoIterateSet(){
        set<String> fruitsSet = new set<String>();
        fruitsSet.add('Apple');
        fruitsSet.add('Orange');
        fruitsSet.add('Kiwi');
        fruitsSet.add('Mango');
        fruitsSet.add('Fig');
        fruitsSet.add('Peach');
        
        for(String fruitName : fruitsSet){
            system.debug('Frit Name: '+ fruitName);
        }
    }
    public void demoIterateSet2(){
        set<String> fruitsSet1 = new set<String>();
        fruitsSet1.add('apple');
        fruitsSet1.add('orange');
        fruitsSet1.add('kiwi');
        fruitsSet1.add('mango');
        fruitsSet1.add('fig');
        fruitsSet1.add('peach');
        system.debug('Set1: '+ fruitsSet1);
        set<String> fruitsSet2 = new set<String>();
        for(String fruitName : fruitsSet1){
            String newFruitName= fruitName.capitalize();
            fruitsSet2.add(newFruitName);
        }
        system.debug('Set2: '+ fruitsSet2);
    }
    
    public void demoIterateMap(){
        Map<Integer,String> employeeMap = new  Map<Integer,String>();
        employeeMap.put(001,'Madhu');
        employeeMap.put(002,'Sri');
        employeeMap.put(003,'Huseyin');
        employeeMap.put(004,'Sara');
        employeeMap.put(005,'Ben');
        
        set<Integer> keysOfMap = new set<Integer>();
        keysOfMap = employeeMap.keyset();
        
        for(Integer empKey : keysOfMap) {
            String empNameValue = employeeMap.get(empKey);
            system.debug('Key is '+ empKey + ' add value is '+ empNameValue);
        }
    }

    

}