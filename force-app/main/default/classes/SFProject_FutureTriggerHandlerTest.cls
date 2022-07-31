@isTest
public class SFProject_FutureTriggerHandlerTest {
	@isTest
    public static void updateProjDescriptionTest(){
        List<Salesforce_Project__c> projList = new List<Salesforce_Project__c>();
        Set<ID> projIds = new Set<ID>();
        for(Integer i=0;i<10;i++){
            Salesforce_Project__c proj = new Salesforce_Project__c();
            proj.Project_Name__c = 'Test'+i;
            proj.Description__c = 'Sample';
            projList.add(proj);
        }
        insert projList;
        for(Salesforce_Project__c proj : projList){
            projIds.add(proj.id);
        }
        //Future - ANY Asynchronous call, Inside Test start/stop, why?
        // Ans - Inside Test start/Stop it runs in a separate context
        Test.startTest();
        	 SFProject_FutureTriggerHandler.updateProjDescription(projIds);
        Test.stopTest();
        //Validation
        List<Salesforce_Project__c> projListUpdate = [Select Description__c from Salesforce_Project__c];
        for(Salesforce_Project__c proj : projListUpdate){
            system.assert(proj.Description__c.contains('Updated from Future'));
            //system.assertEquals('Sample Updated from Future', proj.Description__c);
        }
    }
}