public class ClassWork {
    public static List<Account> getAccounts(){
		List<Account> accList= [SELECT Name,Id,Type FROM Account WHERE Type!=null];
        return accList;
        
    }
    
    public static void populateAllowanceStatus(List<Allowance__c> allList){
       
        for(Allowance__c newList:allList){
            if(newList.Status__c==null){
            	newList.Status__c='Submitted';
        	}
        }
        update allList;
       
    }
    
    public static void updateAccountNumbers(Map<Id, Account> accMap){
        List<Account> accs=new List<Account>();
        accs= accMap.values();
        for(Account accList:accs){
            
            if(accList.AccountNumber==null){
                accList.AccountNumber='ABC123456';
            }   
        }
        update accs;
    }
    
    public Static void countValidContacts(){
        
	}
    
    

}