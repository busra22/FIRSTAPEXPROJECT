public class texas {
    public void homeWork(){
        String stringValue='Austin is Tax free';
        Boolean firstComparison=stringValue.contains('Texas');//false
        system.debug(firstComparison);
        String firstValue='Bubble';
        String secondValue='BUBBLE';
        Boolean result= firstValue.equalsIgnoreCase(secondValue);//true ignoring
        system.debug(result);
    }

}