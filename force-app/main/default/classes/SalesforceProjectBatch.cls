public class SalesforceProjectBatch implements Database.Batchable<sObject>, Database.Stateful {
/* Scenario - update the Project Description , appending 'Updating from Batch'*/
    
    //Start
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([SELECT Description__c FROM Salesforce_Project__c]);
        
    }
    
    //Execute
    public void execute(Database.BatchableContext bc, List<Salesforce_Project__c> records){
        //1.Loop throught the records
        //2.Update the description - existing description+'Updating from Batch'
        //3.Update records
        List<Salesforce_Project__c> projUpdateList=new List<Salesforce_Project__c>();
        for(Salesforce_Project__c proj: records){
            if(proj.Description__c!=NULL){
                proj.Description__c= proj.Description__c + ' Updating from Batch';
            	projUpdateList.add(proj);
            }
            
        }
        if(!projUpdateList.isEmpty()){
            Update projUpdateList;
        }
    }
    
    //Finish
    public void finish(Database.BatchableContext bc){
        system.debug('I am finished');
    }
}