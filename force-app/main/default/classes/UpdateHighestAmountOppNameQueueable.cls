public with sharing class UpdateHighestAmountOppNameQueueable implements Queueable {

    public List<Account> accList = new List<Account>();

    public UpdateHighestAmountOppNameQueueable( List<Account> accList){
        this.accList= accList;
    }

   
    //execute
    public void execute(QueueableContext qc){

        Decimal maxAmount= 0;
        String maxOppName='';
    for(Account acc:accList){
       for(opportunity opp: acc.Opportunities){
            if(opp.Stagename=='Closed Won' && opp.amount !=NULL && opp.amount> maxAmount ){
                maxAmount= opp.amount;
                maxOppName=opp.Name;
            }
        }
        acc.Highest_Amount_Opportunity_Name__c =maxOppName;
    }
    update accList;

    }
}
