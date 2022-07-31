public class DemoWhileDoWhile {
    
    public void demoWhile(){
        Integer count=1;
        while(count<11){
           count++;
           system.debug(count);
        }
    }
    
    public void demoDoWhile(){
        Integer count=1;
        do{
            system.debug('Print Values:'+count);
            count++;
        }while(count<11);
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
            system.debug('Values inside the list: '+ nameValue);
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
 
}