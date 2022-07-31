trigger SalesforceProjectPracticeTrigger on Salesforce_Project__c (before insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        SalesforceProjectPracticeTriggerHandler.createTickets(Trigger.new);
    }
}