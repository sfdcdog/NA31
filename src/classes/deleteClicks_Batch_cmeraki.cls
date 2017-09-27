/**
*@Class: deleteClicks_Batch_cmeraki
*@Type: Batch Class - which calls deleteClicksService_cmeraki to delete Click records when user is de-activated
*@Description: This class uses the service class functionality to delete Click records of de-activated users,
*              as part of data cleansing activity.
*@IMPORTANT: Please run the test class of this Batch class only when User Trigger is set to INACTIVE.
*            Haven't used custom settings to act as switches, to on/off trigger functionality due to 
*            time constraints.
*/
public class deleteClicks_Batch_cmeraki implements Database.Batchable<sObject>{

    /**
    *@Description: Queries all user records that are de-activated.
    *@Params: batch job id
    */
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        //remove all unnecessary data by setting isActive = false in query.
        String query = 'SELECT id, Name, isActive FROM User WHERE isActive = false';
        return Database.getQueryLocator(query);
    }

    /**
    *@Description: Calls the processClicks functionality of the delete clicks service class.
    *@Params: User[] of inactive user records, batch job id
    */    
    public void execute(Database.BatchableContext bc, List<User> scope){
        List<String> inactiveUserList = new List<String>();
        for(User usr: scope){
            inactiveUserList.add(usr.Id);                
        }
        new deleteClicksService_cmeraki().processClicks(inactiveUserList);
    }

    public void finish(Database.BatchableContext bc){}
}