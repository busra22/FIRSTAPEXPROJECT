trigger firstContactTrigger on Contact (before insert,before update,after insert,after update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
        //Code to perform operation on before insert
        system.debug('I am in before insert');
        }
        if(trigger.isUpdate){
        //Code to perform operation on before insert
        system.debug('I am in before update');
        }
        
    }
}