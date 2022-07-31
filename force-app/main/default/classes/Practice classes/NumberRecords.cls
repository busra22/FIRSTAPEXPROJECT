public class NumberRecords{
    public void validateNumbers(Integer inputNum) {
        List<Integer> numberList= new List<Integer>();
        numberList.add(6);
        numberList.add(8);
        numberList.add(10);
        numberList.add(12);
        numberList.add(14);
        numberList.add(15);
        if(numberList.contains(inputNum)){
            system.debug('Number exist');
        }else{
            system.debug('Number does not exist');
        }
        
    }

    public void compareSets(Set<Integer> set2){
        Set<Integer> set1=new Set<Integer>();
        set1.add(111);
        set1.add(222);
        set1.add(333);
        if(set1.equals(set2)){
            system.debug('Both sets are identical');
        }else{
            system.debug('Both sets are not identical');
        }
        
    }
}