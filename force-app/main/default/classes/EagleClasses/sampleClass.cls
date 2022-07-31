public class sampleClass {    
   /*Method to return String*/
   public string getFullName(String firstName,String lastName){
    String fullName = firstName + lastName;
    return fullName;
   }
    /*Method to return Integer*/
    public Integer getSum(Integer a,Integer b,Integer c){
        Integer sum = a + b+ c;
        return sum;
    }
    /*Method to return Boolean*/
    public Boolean getContains(String demoString){
        Boolean checkContainsValue = demoString.contains('testing');
        return checkContainsValue;
    }

    public string classWork(string firstName){
        string reverseString = firstName.reverse();
        return reverseString;
    }

    /*Constructor*/
    public sampleClass(){
        system.debug('This is empty');
    }
    public sampleClass(String input){
        system.debug('This is an input string' +input);
    }
}