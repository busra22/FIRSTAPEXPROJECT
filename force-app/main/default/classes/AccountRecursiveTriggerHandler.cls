public class AccountRecursiveTriggerHandler {
    public static Boolean isTriggerFirstRun=False;
    public static void recursivePractice(List<Account> accTriNew){
       	isTriggerFirstRun=True;
        List<Account> accList= new List<Account>();
        for(Account acc:accTriNew){
            Account accDup= new Account();
            accDup.Name='Recursive duplicate';
            accList.add(accDup);
        }
        if(!accList.isEmpty()){
            insert accList;
   		}
        
    }
}