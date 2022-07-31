public class ContactPracticeTriggerHandler {
       //Scenario 2a
    public static void errorValidation1(List<Contact> conList){
        for(Contact con : conList){
            if(con.LeadSource == 'Partner Referral'){
                con.addError('Cannot insert/update with Partner Referral');
            }
        }
        
    }
    
    //Scenario 2b
    public static void errorValidation2(List<Contact> conList, Map<ID,Contact> conOldMap){
        //LeadSource - Web
        //LeadSource - Phone Inquiry
        for(Contact con : conList){
            //Map<Key,Value>, to retrieve the values, get(Key)
            //conOldMap.get(con.id) => Contact record
            if(con.LeadSource != conOldMap.get(con.id).LeadSource){
                con.addError('Cannot update LeadSource');
            }
        }
    }
    //Practice 2-eagle- first try
    
    public static void updateContactPhone(List<Contact> conTriNew){
        List<Contact> conList= [SELECT FirstName,Id,AccountId,OtherPhone, Account.Phone FROM Contact WHERE AccountId!=NULL AND Id IN:conTriNew ];
        for(Contact con:conList){
            con.OtherPhone=con.Account.Phone;
            conList.add(con);
        }
        update conList;
    }
    
    //Practice 2 -try again
    public static void updateContPhoneWithAccPhone(List<Contact> conTriNew){
        Set<id> accId= new Set<id> ();
        for(Contact con: conTriNew){
            accId.add(con.AccountId);
        }
        List<Account> accWithConList= [SELECT Name,Id,Phone,
                                          (SELECT FirstName,OtherPhone,AccountId FROM Contacts WHERE AccountId!=NULL ) 
                                       FROM Account
                                       WHERE id IN: accID ];
        List<Contact> conList=new List<Contact>();
        for(Account acc: accWithConList){
            for(Contact con:acc.Contacts){
                con.OtherPhone=acc.Phone;
                conList.add(con);
            }
        }
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    //Practice Madhu cozumu
     public static void phoneFieldUpdate(List<Contact> conList){
        Set<ID> accIds = new Set<ID>();
        //Fetching the Account IDs        
        for(Contact con : conList){
            if(con.AccountId != NULL){
                accIds.add(con.AccountId);
            }
        }
        //SOQL - Account
        List<Account> accList = [Select id,Phone from Account where ID IN: accIds];
        Map<ID,Account> accMap = new Map<ID,Account>();
        for(Account acc : accList){
            accMap.put(acc.id,acc);
        }
        
        //Looping through Contacts to fill other phone(contact) to phone(account)
        for(Contact con : conList){
            if(accMap.containsKey(con.AccountId)){
                con.OtherPhone = accMap.get(con.AccountId).Phone;
            }
        }       
        
    }
    
   
}