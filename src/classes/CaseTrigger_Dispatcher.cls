public class CaseTrigger_Dispatcher{
    public static void beforeMethod(List<Case> oldList, List<Case> newList, 
                    Map<Id,Case> oldMap,Map<Id,Case> newMap){
        if(trigger.isInsert){
           CaseTriggerHandler.beforeInsertCalls(newList, newMap);
        }
        if(trigger.isUpdate){
           CaseTriggerHandler.beforeUpdateCalls(oldList, newList, oldMap, newMap);
        }
        if(trigger.isDelete){
           CaseTriggerHandler.beforeInsertCalls(oldList, oldMap);
        }
    }  
    
    public static void afterMethod(List<Case> oldList, List<Case> newList, 
                            Map<Id,Case> oldMap,Map<Id,Case> newMap){
        if(trigger.isInsert){
            CaseTriggerHandler.afterInsertCalls(newList, newMap);
        }
        if(trigger.isUpdate){
            CaseTriggerHandler.afterUpdateCalls(oldList, newList, oldMap, newMap);    
        }
        if(trigger.isDelete){

        }
    }
}