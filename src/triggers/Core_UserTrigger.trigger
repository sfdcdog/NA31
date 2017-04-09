trigger Core_UserTrigger on User (before insert, before update, before delete, after insert, after update, after delete) {
    if(trigger.isBefore){
        //Core_UserTrigger_Dispatcher.beforeMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
    if(trigger.isAfter){
        //Core_UserTrigger_Dispatcher.afterMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
}