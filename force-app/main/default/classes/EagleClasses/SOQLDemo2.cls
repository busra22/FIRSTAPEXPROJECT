public class SOQLDemo2 {
    public static void projectToTickets() {
        List<Salesforce_Project__c> projWithTicktsList = [SELECT Project_Name__c, Name, Status__c, (SELECT Name, Status__c, Priority__c FROM Salesforce_Tickets__r) FROM Salesforce_Project__c WHERE Status__c = 'New'];
        for(Salesforce_Project__c proj:projWithTicktsList){
            system.debug('Project Name: '+proj.Project_Name__c);
            for(Salesforce_Ticket__c ticket : proj.Salesforce_Tickets__r){
                system.debug('Ticket : '+ticket.Name+ 'Status : '+ticket.Status__c);
            }
        }
    }
    //SOQL Account to Opportunity
    public static void accToOpps(){
        List<Account> accToOppsList = [SELECT Name,(Select CloseDate from Opportunities where CloseDate  > Today) FROM Account];
        for(Account acc : accToOppsList ){
            system.debug('Account Name: '+acc.Name);
            for(Opportunity opp : acc.Opportunities){
            system.debug('ClosedDate : '+opp.CloseDate);
            }
         }
    }

}