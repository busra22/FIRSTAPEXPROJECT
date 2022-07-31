public with sharing class SalesforceProjectBatchScheduler implements Schedulable{

    //Execute
    public void execute(SchedulableContext sc){
        Database.executeBatch(new SalesforceProjectBatch(),1);
    }
}