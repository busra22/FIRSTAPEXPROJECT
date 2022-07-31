public with sharing class UpdateLeadStatusQueueable implements Queueable {

    public List<Lead> leadList = new List<Lead>();
    public UpdateLeadStatusQueueable(List<Lead> inputLeadList) {
        this.leadList=inputLeadList;
    }
    //Execute
    public void Execute(QueueableContext qc){
        if(!leadList.isEmpty()){
            for(Lead ld:leadList ){
                if(ld.Status=='Working - Contacted'){
                    Ld.Status='Closed - Converted';
                }
            }
            update leadList;
        }
    }

}