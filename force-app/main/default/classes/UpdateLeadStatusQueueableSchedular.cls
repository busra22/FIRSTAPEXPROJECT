public with sharing class UpdateLeadStatusQueueableSchedular {
     //Execute
     public void execute(SchedulableContext sc){
        Database.executeBatch(new SalesforceProjectBatch(),1);
    }
}
