trigger ContactPractceTrigger on Contact (before insert,before update, after insert, after update) {
    if(trigger.isBefore && trigger.isInsert){
        ContactPracticeTriggerHandler.errorvalidation1(trigger.new);
    }
    
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
        ContactPracticeTriggerHandler.errorValidation1(Trigger.new);
        }
        if(Trigger.isUpdate){
        ContactPracticeTriggerHandler.errorValidation2(Trigger.New,Trigger.OldMap);    
        }
    }
    
    if(Trigger.isAfter && Trigger.isInsert){
        ContactPracticeTriggerHandler.updateContPhoneWithAccPhone(Trigger.New);
    }
}