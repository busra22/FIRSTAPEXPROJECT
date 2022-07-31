public class SalesforceProjectPracticeTriggerHandler {
    public static void createTickets(List<Salesforce_Project__c> projNew){
        List<Salesforce_Ticket__c> ticket=new List<Salesforce_Ticket__c>();
        for(Salesforce_Project__c proj : projNew){
            Salesforce_Ticket__c tckt= new Salesforce_Ticket__c();
            tckt.Priority__c='Medium';
            tckt.Subject__c='Default Ticket';
            tckt.Salesforce_Project__c=proj.id;
            ticket.add(tckt);
        }
        if(!ticket.isEmpty()){
            insert ticket;
        }
        
    }
    //Practices - Assignment -While updating Salesforce Project’s status = ‘Complete’.It should not allow user to mark Salesforce Project as 
    //complete,  if any ticket of that project is not completed
     public static void errorIfNoTicketClosed(List<Salesforce_Project__c> projNew,Map<Id,Salesforce_Project__c> projNewMap){
        Set<Id> projIds= new Set<Id>();
         for(Salesforce_Project__c proj:projNew){
             if(proj.Status__c=='Completed'){
                 projIds.add(proj.id);
             }
         }
         if(!projIds.isEmpty()){
             List<Salesforce_Project__c> projWithTicketsOpen=[SELECT Id,Status__c, (SELECT ID,Status__c FROM Salesforce_Tickets__r WHERE Status__c !='Completed')FROM Salesforce_Project__c WHERE ID IN:projIds];
             for(Salesforce_Project__c proj : projWithTicketsOpen){
                if(proj.Salesforce_Tickets__r.size() > 0){
                    //AddError can be used only with Context variables
                    //proj.addError('test'); - See the error
                    projNewMap.get(proj.id).addError('Project cannot be completed with Open Tickets');
                }
            }
         }
     }
    
         
}