public class SOQLDemo {
     /*public static void accountSOQL1() {
        List<Account> accList=[SELECT ID,Name FROM Account WHERE Name LIKE '%United%'];
        system.System.debug('Account List: '+ accList);
    }

    public static void accountSOQL2() {
        List<Account> acc=[SELECT ID,Name FROM Account WHERE Name LIKE '%United%' LIMIT 1];
        system.System.debug('Account List: '+ acc);
    }
    public static void accountSOQL3() {
        List<Account> acc=[SELECT ID, Name, Phone, Rating FROM Account WHERE Name LIKE '%United%' LIMIT 1 ];
        system.debug('Account List: '+ acc);
        system.debug('Name: '+acc.Name);
        system.debug('Phone: '+acc.Phone);
        String ratingValue=acc.Rating;
        system.debug('Rating: '+ ratingValue);
    }*/

    public static void oppSOQLwithVariable(){
        String stageValue= 'Closed Won';
        List<Opportunity> oppList = [SELECT Name,Amount,StageName FROM Opportunity WHERE StageName=:stageValue];
        system.debug('Opportunity List: '+oppList);
    }
  
}
