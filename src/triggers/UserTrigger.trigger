trigger UserTrigger on User (after insert, after update, after delete, before insert, before update, before delete) {
    if(trigger.isBefore){
        UserTrigger_Dispatcher.beforeMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
    if(trigger.isAfter){
        UserTrigger_Dispatcher.afterMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
}