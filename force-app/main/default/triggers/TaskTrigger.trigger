trigger TaskTrigger on Task (before insert,after insert,after update) {
    TaskTriggerHandler.updateLeadNextActivityDate(Trigger.New,Trigger.Old, Trigger.NewMap,Trigger.oldMap);
}