public with sharing class DeleteOppsInvocable {
    @InvocableMethod
    public static void deleteOpps(List<Id> accIds){
        List<Opportunity> oppList = [Select ID,StageName, AccountId 
                          FROM Opportunity where AccountId IN:accIds 
                          AND StageName = 'Closed Lost'];
        if(!oppList.isEmpty()){
            Delete oppList;
        }
    }
}






