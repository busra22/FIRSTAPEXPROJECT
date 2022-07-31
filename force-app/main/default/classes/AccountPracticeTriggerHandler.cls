public class AccountPracticeTriggerHandler {
    
    //Scenerio 1
    public static void fillShippingDetails(List<Account> accList){
        
        for(Account acc:accList){
            if(acc.ShippingStreet==NULL){
                acc.ShippingStreet=acc.BillingStreet;
            }
            
            if(acc.ShippingCity==NULL){
                acc.ShippingCity=acc.BillingCity;
            }
            if(acc.ShippingState==NULL){
                acc.ShippingState=acc.BillingState;
            }
            if(acc.ShippingPostalCode==NULL){
                acc.ShippingPostalCode=acc.BillingPostalCode;
            }
            if(acc.ShippingCountry==NULL){
                acc.ShippingCountry=acc.BillingCountry;
            }
        }
    }
    //Scenerio 4
    public static void matchMailingAddressContacts(List<Account> accTriNew, Map<Id,Account> accOldMap){
        //10 accounts -Trigger.new
       
        //IMPORTANT: WHY we use MAP instead of List??????
        //Iterate List -100(Find an ID in a List)
        //for(i=0;i<99;i++)
        //Find ID in a MAP -get(ID)
        //It is more efficiet to use Map!!!
  
        
        List<Account> accToUpdate=new List<Account>();
        for(Account acc: accTriNew){
            if(acc.BillingStreet != accOldMap.get(acc.Id).BillingStreet){
                accToUpdate.add(acc);
                
            }
        }
        
        //SOQL - To Fetch Contacts
        List<Account> accWithContactList = [SELECT Id,Name,(SELECT Id,Name FROM Contacts)FROM Account WHERE Id IN :accToUpdate];
        List<Contact> conToUpdate=new List<Contact>();
        for(Account acc: accWithContactList){
            for(Contact con: acc.Contacts){
                con.MailingStreet= acc.BillingStreet;
                con.MailingCity=acc.BillingCity;
                con.MailingState=acc.BillingState;
                con.MailingCountry= acc.BillingCountry;
                con.MailingPostalCode=acc.BillingPostalCode;
                conToUpdate.add(con);
            }
        }
        
        if(!conToUpdate.isEmpty()){
            insert conToUpdate;
        }
        
    }
    
    //Scenerio 3
    public static void updateAccDescription(List<Account> accTriNew, Map<Id,Account> accOldMap,Boolean directFlag ){
        for(Account acc:accTriNew ){
            //Update Operation
            if(!directFlag){
            	if(acc.Active__c!=accOldMap.get(acc.Id).Active__c && acc.Active__c=='Yes'){
                	acc.Description='Account is active';
            	}
        	}
        //Insert operation
            if(directFlag && acc.Active__c=='Yes'){
                acc.Description='Account is active';    
            }

        }
    }
    //Scenerio 5b
    
    public static void accWithContactVIP(List<Account> accTriNew, Map<Id,Account> accNewMap, Map<Id,Account> accOldMap){
        Set<ID> accVIPChanged=new Set<ID>();
        for(Account acc: accTriNew){
            if(acc.VIP__c!=accOldMap.get(acc.id).VIP__c){
                accVIPChanged.add(acc.id);
                
            }
        }
        List<Contact> conList = [SELECT Id,Name,Account.Id FROM Contact WHERE Account.Id IN :accVIPChanged];
        for(Contact con: conList){
        	con.VIP__c=accNewMap.get(con.Account.Id).VIP__c;
        }
        update conList;

    }
    //Scnerio 6
    public static void addErrorOnDelete(List<Account> accTriOld){
		for(Account acc : accTriOld){
            if(acc.Active__c =='Yes'){
                acc.addError('You cannot delete active Account.');
            }
        }        
    }
    
    //Scnerio 7
    public static void sendEmailOnDelete(List<Account> accTriOld){
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        for(Account acc : accTriOld){
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Account Delete Confirmation');
            emailMsg.setPlainTextBody('Account Name : ' +acc.Name+  'is Deleted');
            emailMsgs.add(emailMsg);            
        }
        Messaging.sendEmail(emailMsgs);       
        
    }
    //Scnerio 8
    public static void sendEmailOnUndelete(List<Account> accTriNew){
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
        List<Account> accList = new List<Account>();
        
        for(Account acc : [Select ID,Name from Account where ID IN:accTriNew]){
            //Mark it Active
            acc.Active__c = 'Yes'; 
            accList.add(acc);
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());            
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Account Restore Confirmation');
            emailMsg.setPlainTextBody('Account Name : ' +acc.Name+  'is Active now');
            emailMsgs.add(emailMsg);
        }
        if(!accList.isEmpty()){
            update accList;
        }
        Messaging.sendEmail(emailMsgs);      
        
    }
    //Practice-Eagle
    public static void setOppStage(List<Account> accTriNew){
		List<Account> accWithOppsList=[SELECT Name,Id,(SELECT Id,StageName FROM Opportunities WHERE StageName!='Closed Won') FROM Account WHERE Id IN :accTriNew];
         List<Opportunity> oppToUpdate = new List<Opportunity>();
        for(Account acc : accWithOppsList){
            for(Opportunity opp : acc.Opportunities){
                opp.StageName = 'Closed Lost';
                oppToUpdate.add(opp);
            }
        }
        if(!oppToUpdate.isEmpty()){
            update oppToUpdate;
        }
            
    
    }
    
    //practice- try again
    public static void updateOpp(List<Account> accTriNew){
        set<id> accId= new set<id>();
        for(Account acc: accTriNew){
            accId.add(acc.id);
        }
        List<Account> accWithOpp=[SELECT Id,Name,(SELECT id,StageName FROM Opportunities WHERE StageName!='Closed Won') FROM Account WHERE Id IN : accId];
        List<Opportunity> oppToUpdate = new List<Opportunity>();
        for(Account acc:accWithOpp){
            for(Opportunity opp:acc.Opportunities){
                opp.StageName='Closed Lost';
                oppToUpdate.add(opp);
            }
        }
        if(!oppToUpdate.isEmpty()){
            Update oppToUpdate;
        }
    }
    //Design 1 - When Account is created with industry as Banking then create a contact with contact lastName as account name
    public static void createConLastNameAccName(List<Account> triNew){
       
        List<Contact> conListToCreate= new List<Contact>();
        for(Account acc:triNew){
            if(acc.Industry=='Banking'){
            	Contact con= new Contact();
            	con.LastName=acc.Name;
                con.AccountId=acc.Id;
            	conListToCreate.add(con);   
            }
            
        }
        
        if(!conListToCreate.isEmpty()){
            insert conListToCreate;
        }
        	
        
    }
    //Madhu way Design 1 - When Account is created with industry as Banking then create a contact with contact lastName as account name
    public static void createContactLastNameAsAccountName(List<Account> triNewAccount){
        //Step 1 : After Insert Trigger & In Handler, get the Accounts - Trigger.new
        //Step 2 : Filter for Accounts with Industry as Banking, i.e in For loop - if(acc.Industry == 'Banking'),
		//add to Map<ID,String> - store AccountID and AccountName in map, mapName.put(acc.id,acc.Name)

        Map<Id,String> accMap = new Map<Id,String>();
        for(Account acc : triNewAccount ){
            if(acc.Industry == 'Banking'){
              accMap.put(acc.Id,acc.Name);
            }
        }
       // Step 3 : Have a list created for Contact outside the loop
       //Step 4 : For the Map keyset, create contact, i.e,
		//for(Account acc : Map.keySet())
       List<Contact> conList = new List<Contact>();
        for(Id accId : accMap.keySet()){
        // Step 5 : Inside the loop create each contact assign the mandatory fields,
		//con.LastName = map.get(acc.id) -> will retrieve the value which is AccountName.
         Contact con = new Contact();
            con.LastName = accMap.get(accId);
           // Step 6 : Add the contact to the List inside loop
            conList.add(con);
        }
        //Step 7 : Outside loop, If List not empty -> insert Contact List*/
        if(!conList.isEmpty()){
            insert conList;
        }
    }
    //Design 2
    public static void createContactsnumberOfContacts(List<Account> accTriNew){
         List<Contact> conListToCreate= new List<Contact>();
         List<Account> accList=[SELECT id,Number_of_Contacts__c FROM Account WHERE Number_of_Contacts__c!=NULL AND Id IN:accTriNew];
        for(Account acc:accList){
            for(Integer i=0;i<acc.Number_of_Contacts__c;i++){
           		Contact con= new Contact();
            	con.LastName='Last.Name'+i;
                con.AccountId=acc.Id;
            	conListToCreate.add(con);   
            }
        }
         if(!conListToCreate.isEmpty()){
           	insert conListToCreate;
        }
        
            
 	}
}