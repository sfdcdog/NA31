/**
*@Class: UserTrigger_Dispatcher
*@Type: Dispatcher Class - Used to control flow of execution and can include trigger switches to on/off
*       functionality.
*@Description: This class houses all method calls to scenarios of before and after contexts{excluding undelete}. Each individual conditions
*              will call all those Handler class methods that contain functionality corresponding to the scenario
*/
public class UserTrigger_Dispatcher{
    public static void beforeMethod(List<User> oldList, List<User> newList, 
                    Map<Id,User> oldMap,Map<Id,User> newMap){
        if(trigger.isInsert){
           //UserTriggerHandler.beforeInsertCalls(newList, newMap);
        }
        /**
        *@Description: Only Before Update Scenario is run here. 
        */
        if(trigger.isUpdate){
           UserTriggerHandler.beforeUpdateCalls(oldList, newList, oldMap, newMap);
        }
        if(trigger.isDelete){
           //UserTriggerHandler.beforeInsertCalls(oldList, oldMap);
        }
    }  
    
    public static void afterMethod(List<User> oldList, List<User> newList, 
                            Map<Id,User> oldMap,Map<Id,User> newMap){
        if(trigger.isInsert){
            //UserTriggerHandler.afterInsertCalls(newList, newMap);
        }
        if(trigger.isUpdate){
            //UserTriggerHandler.afterUpdateCalls(oldList, newList, oldMap, newMap);    
        }
        if(trigger.isDelete){

        }
    }
}