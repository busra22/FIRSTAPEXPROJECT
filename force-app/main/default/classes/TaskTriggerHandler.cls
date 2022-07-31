//Next activity date should automatically populated with upcoming task date
//if task is closed/deferred uodate the Next Activity date with OPEN upcoming task

public class TaskTriggerHandler {
    //Short videos
    public static void updateLeadNextActivityDate(List<Task> triNew, List<Task> triOld,map<Id,Task> triNewMap, map<Id,Task> triOldMap) {
        Set<Id> setOfLeadId =new set<Id>();

        
        for(task t:triNew){
            
            
            //burda who id hem lead de hem de contact ta oldugu icin whoId nin leadden geldigine emin olmamiz lazim

            //t.whoId is if Lead(whoid is for Contact or Lead, so make sure it is from the Lead.)
            //t.whoId is not null
            if(t.whoId != null && t.whoId.getSobjectType().getDescribe().getName()=='Lead'
            && t.ActivityDate !=NULL&&
            (
                triOld==NULL
                ||
                (triOld!=null && (t.ActivityDate != triOldMap.get(t.id).ActivityDate)
                    || (t.Status != triOldMap.get(t.id).Status)
            )
            )){
                setOfLeadId.add(t.whoId);

            }
            
        }
        if(setOfLeadId.isEmpty()){
            return;
        }
        List<Lead> allLeads=[SELECT Id,Name,Next_Activity_Date__c,
                                (SELECT Id,ActivityDate,Status 
                                FROM Tasks WHERE Status !='Completed' AND Status!='Deferred' 
                                ORDER BY ActivityDate LIMIT 1) 
                            FROM Lead WHERE Id In:setOfLeadId];
        List<Lead> updateLeads=new List<Lead>();
        for(Lead l:allLeads){
            if(l.Tasks != NULL && !l.Tasks.isEmpty()){
                task t = l.Tasks[0];

                if(t.ActivityDate>=Date.today()){
                    l.Next_Activity_Date__c=t.ActivityDate;

                }else{
                    l.Next_Activity_Date__c=NULL;
                }
            }else{
                l.Next_Activity_Date__c=NULL;
            }
            updateLeads.add(l);
        }
        if(!updateLeads.isEmpty()){
            update updateLeads;
        }
    }
    // try again
    public static void updateActivityDate(List<Task> triNew, List<Task> triOld,map<Id,Task> triNewMap, map<Id,Task> triOldMap){
        
    }
    //Task is Inserted// Madhu 
    public static void updateLeadOnTaskInsert(List<Task> taskTriNew){
        Set<ID> leadIDs = new Set<ID>();
        //Get the Lead IDs  
        for(Task tsk : taskTriNew){
                if(tsk.WhoId != NULL && tsk.WhoId.getSObjectType().getDescribe().getName() == 'Lead'){
                    leadIDs.add(tsk.WhoId);
                }
        }
        if(!leadIDs.isEmpty()){
            updateLead(leadIDs);
        }        
    }
    //Task is updated
    public static void updateLeadOnTaskUpdate(List<Task> taskTriNew,Map<ID,Task> taskOldMap){
        Set<ID> leadIDs = new Set<ID>();
        //Get the Lead IDs  
        for(Task tsk : taskTriNew){
                if(tsk.WhoId != NULL && tsk.WhoId.getSObjectType().getDescribe().getName() == 'Lead'){
                    //If the Activity date or Status is changed
                    if(tsk.ActivityDate != taskOldMap.get(tsk.id).ActivityDate ||
                       tsk.Status != taskOldMap.get(tsk.id).Status){
                        leadIDs.add(tsk.WhoId);
                    }
                }
        }
        if(!leadIDs.isEmpty()){
            updateLead(leadIDs);
        }        
    }
    public static void updateLead(Set<ID> leadIDs){          
        //SOQL - Query the Lead IDs, respective field
        List<Lead> leadToUpdate = [Select ID, Next_Activity_Date__c, (Select id, ActivityDate, Status FROM Tasks where Status != 'Completed' AND Status !='Deferred' ORDER BY ActivityDate LIMIT 1) FROM Lead where ID IN :leadIDs];
        for(Lead ld : leadToUpdate){
                if(ld.Tasks.size() > 0){
                    if(ld.Tasks.get(0).ActivityDate != NULL)
                    ld.Next_Activity_Date__c = ld.Tasks.get(0).ActivityDate;
                }else{
                    ld.Next_Activity_Date__c = NULL;
                }
        }
        update leadToUpdate;
    }


}