/*public class PlayingWithStringsDate {
    public void printOutput(){
        system.debug('Welcome to Practice');

        String prac1= 'Hello Eagles!  '
        system.debug(prac1.trim());

        String prac2='marvel'
        system.debug(prac2.capitalize());

        system.debug(Date.today());
        system.debug(Date.today().addDays(1));

        system.debug(Date.newInstance(2022,03,15));


    }
    
}*/
public class PlayingWithStringsDate {
    
    /*Constructor*/
    public playingWithStringsDate(){
        //Display a welcome message 
        system.debug('Welcome to Practice');
    }
    
    /*Print all values Method*/
    public void printOutput(){
        //Remove blank spaces
        string myString1 = 'Hello Eagles!    ';
        system.debug('Print Value 1: '+myString1);
        //Convert string
        string myString2 = 'marvel';
        system.debug('Print Value 2: '+myString2.capitalize());
        //Print yesterday and tomorrow
        Date todayDate = Date.today();
        Date yesterdayDate = todayDate.addDays(-1);
        Date tomorrowDate = todayDate.addDays(1);
        system.debug('Print Yesterday :'+yesterdayDate);
        system.debug('Print Tomorrow :'+tomorrowDate);
        //Format date
        DateTime dt = DateTime.newInstance(2021, 3, 15);
        String dtFormat = dt.format('YYYY/MM/DD');
        system.debug('Print Formatted Date :'+dtFormat);
    }
}