public class demoPrimitiveDataTypes {
    
    public void displayValues(){
        string favCharacter='Rachel';
        Integer season=10;
        Boolean isHeCute= True;
        
        system.debug('My favorite character'+favCharacter);
        system.debug('How many seasons in Friends'+season);
        system.debug('Is Joey Cute?'+isHeCute+ 'Yes He Is');

        Long myLongNum = 1773737L;
        Double myDoubleNum = 255.88;
        system.debug('print my long number '+ myLongNum);
        system.debug('print my double number '+myDoubleNum);

        Date mydate = system.today();
        Id mySalesforceId = '0018b000020VKo1AAG';
        Object myObj = 12345;
        system.debug('print my date '+mydate);
        system.debug('print my ID'+mySalesforceId);
        system.debug('print the obj'+myObj);

        String firstName ='Busra';
        string lastName = 'Oz';
        string fullName = firstName + lastName;



    }

}