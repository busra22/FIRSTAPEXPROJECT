public class AccountSumAmountOppsBatch implements Database.Batchable<sObject>, Database.Stateful {
    public Decimal overallSumOfOpps =0;
//Start
    public Database.QueryLocator start(Database.BatchableContext bc){
        String queryString='Select Id,Sum_of_Amount_Opps__c from Account';
        return Database.getQueryLocator(queryString);
        
    }
    
    //Execute
    public void execute(Database.BatchableContext bc, List<Account> records){
       
        for(Account acc: records){
            if(acc.Sum_of_Amount_Opps__c!=NULL){
            overallSumOfOpps = overallSumOfOpps + acc.Sum_of_Amount_Opps__c;
        	}
        }
   
    }
    
    //Finish
    public void finish(Database.BatchableContext bc){
        system.debug('overallSumOfOpps'+ overallSumOfOpps);
         AsyncApexJob asyncJob = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed, TotalJobItems
                                 FROM AsyncApexJob WHERE Id =:BC.getJobId()];  
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Account Calculation Status - '+asyncJob.Status);
       		 /*'\n' - new line/next line*/
            String body ='Total sum of Amount Account, '+ overallSumOfOpps;
            emailMsg.setPlainTextBody(body);
            emailMsgs.add(emailMsg);            
        
        Messaging.sendEmail(emailMsgs);       
        
    }
}