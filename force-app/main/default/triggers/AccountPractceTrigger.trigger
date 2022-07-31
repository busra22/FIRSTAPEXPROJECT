trigger AccountPractceTrigger on Account (before insert,after insert,before update,after update,before delete,after delete,after Undelete) {
    //No DML inside before Triggers
    //Scenerio1
    /*if(Trigger.isBefore && Trigger.isInsert){
        AccountPracticeTriggerHandler.fillShippingDetails(Trigger.new);
        
    }
    
     //Scenerio 4
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountPracticeTriggerHandler.matchMailingAddressContacts(Trigger.new,Trigger.oldMap);
    }
    //Scenerio 5
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            Boolean directFlag=Trigger.isInsert;
            AccountPracticeTriggerHandler.updateAccDescription(Trigger.new,Trigger.oldMap,directFlag);
        }
    }
    //Scnerio 5b
    if(Trigger.isAfter && Trigger.isUpdate ){
        AccountPracticeTriggerHandler.accWithContactVIP(Trigger.new,Trigger.newMap,Trigger.oldMap);
    }
    //Scnerio 6
    if(Trigger.isBefore && Trigger.isDelete){
        AccountPracticeTriggerHandler.addErrorOnDelete(Trigger.old);
    }
    //Scnerio 7
    if(Trigger.isAfter && Trigger.isDelete){
        AccountPracticeTriggerHandler.sendEmailOnDelete(Trigger.old);
    }
    //Scnerio 8
    if(Trigger.isBefore && Trigger.isUndelete){
        AccountPracticeTriggerHandler.sendEmailOnDelete(Trigger.new);
    }
    //Practice-Eagle
    if(Trigger.isAfter && Trigger.isUpdate){
        AccountPracticeTriggerHandler.setOppStage(Trigger.new);
        
    }*/
    //Design - assignment
    if(Trigger.isAfter && Trigger.isInsert){
        
        AccountPracticeTriggerHandler.createContactLastNameAsAccountName(Trigger.new);

        
    }
    
    if(Trigger.isAfter && Trigger.isInsert  && !system.isQueueable()){        
        system.enqueueJob(new secondJobQueueable(Trigger.new));
    }


}