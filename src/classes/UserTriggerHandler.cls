/**
*@Class: UserTriggerHandler
*@Type: Handler Class - Used to house all functionality associated with User Trigger scenarios
*       functionality.
*@Description: This class has all scenarios of before and after contexts{excluding undelete}. Each individual conditions
*              will call all those Handler class methods that contain functionality corresponding to the scenario
*/
public class UserTriggerHandler{

    /*
    public static void beforeInsertCalls(List<User> newList,Map<Id,User> newMap){
     
        
    }*/

    public static void beforeUpdateCalls(List<User> oldList, List<User> newList, Map<Id,User> oldMap, Map<Id,User> newMap){
        List<String> inactiveUserList = new List<String>();
        //Using SOQL FOR Loops to avoid heap size issues.
        for(User usr: newMap.values()){               
            inactiveUserList.add(usr.Id);                
        }
        
        system.debug('handler class list:'+inactiveUserList);
        if(inactiveUserList <> null){
            Clicks_cmeraki deleteClicksService = (Clicks_cmeraki)Clicks_Factory_cmeraki.deleteClicks('deleteClicksService_cmeraki');
            deleteClicksService.delete_ifUserInactive(inactiveUserList);
        }
    }

    /*public static void beforeDeleteCalls(List<User> oldList, Map<Id,User> oldMap){
        
    }

    public static void afterInsertCalls(List<User> newList,Map<Id,User> newMap){

    }
    

    public static void afterUpdateCalls(List<User> oldList, List<User> newList, Map<Id,User> oldMap, Map<Id,User> newMap){
      
        
    }*/
}