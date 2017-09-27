trigger CaseTrigger on Case (after insert, after update, after delete, before insert, before update, before delete) {
    if(trigger.isBefore){
        CaseTrigger_Dispatcher.beforeMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
    if(trigger.isAfter){
        CaseTrigger_Dispatcher.afterMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
}