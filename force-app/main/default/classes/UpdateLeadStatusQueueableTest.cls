@isTest
public with sharing class UpdateLeadStatusQueueableTest {

    @isTest
    public static void testMethod1(){
        List<Lead> leadList= TestDataFactory.createLead(50);
        UpdateLeadStatusQueueable ld = new UpdateLeadStatusQueueable(leadList);
        //Execute the Quenueu
        test.StartTest();
            system.enqueueJob(ld);
        test.stopTest();

        List<Lead> leadToUpdate=[SELECT Status FROM Lead];

        for(Lead l: leadToUpdate){
            system.assertEquals('Closed - Converted', l.Status);
        }
        


    }
}