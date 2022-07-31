public with sharing class secondJobQueueable implements Queueable{

    public List<Account> accList=new List<Account>();
    public secondJobQueueable(List<Account> accList) {
        this.accList=accList;
    }

    public void execute (QueueableContext qs){
        List<Contact> conList= new List<Contact>();
        for(Account acc:accList){
            Contact con=new Contact();
            con.LastName='QueueContact';
            con.AccountId=acc.id;
            conList.add(con);
        }

        if(!conList.isEmpty()){
            insert conList;
        }
    }
}
