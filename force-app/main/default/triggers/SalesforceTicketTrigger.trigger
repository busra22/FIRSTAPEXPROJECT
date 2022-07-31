trigger SalesforceTicketTrigger on Salesforce_Ticket__c (before insert) {
	if(Trigger.isAfter && Trigger.isUpdate){
        SalesforceTicketTrigger.projMarkComplete(Trigger.new);
}
}