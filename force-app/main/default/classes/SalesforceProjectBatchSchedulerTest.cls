@isTest
public with sharing class SalesforceProjectBatchSchedulerTest {
   
    @isTest 
    public static void testMethod1(){
        List<Salesforce_Project__c> projList = TestDataFactory.createProjects(1);
        test.startTest();
        SalesforceProjectBatchScheduler schProj = new SalesforceProjectBatchScheduler();
        String cron = '0 30 22 * * ? *'; // 10.30PM
        system.schedule('SFProjectBatchScheduler', cron, schProj);
        test.stopTest();
        //Validation
        List<AsyncApexJob> jobsScheduled = [select Id, ApexClass.Name, Status, JobType from AsyncApexJob where JobType = 'ScheduledApex'];
        system.assert(jobsScheduled.size() == 1);
        system.assertEquals('SalesforceProjectBatchScheduler', jobsScheduled.get(0).ApexClass.Name);
    }
}

