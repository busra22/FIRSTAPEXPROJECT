public class LoopDemoPractice {
    public Integer sumOfIntegers(List<Integer> inputList){
        Integer sum = 0;
        if(!inputList.isEmpty()){
            for(Integer i=0; i<inputList.size(); i++){
				sum = sum + inputList.get(i);
            }
        }
        
        return sum;
        
    }
    public void reverseListValues(){
        List<Integer> numberList= new List<Integer>();
        numberList.add(10);
        numberList.add(20);
        numberList.add(30);
        numberList.add(40);
        numberList.add(50);
        system.debug('Number list: '+ numberList);
        List<Integer> reverseList=new List<Integer>();
        for(Integer i=numberList.size()-1;i>=0;i--){
            reverseList.add(numberList.get(i));
        }
        system.debug('Reverse list: '+ reverseList);
        
    }
}