/**
*@Class: deleteClicksService_cmeraki
*@Type: Service Class - which contains core fucntionality of deleting Click records when user is de-activated
*@Description: This service class can implement a queueable and also be called from a batch class, 
*              as the code is structured to be modular and abstract.
*/
public class deleteClicksService_cmeraki extends Clicks_cmeraki implements Queueable{

    private List<Click__c> clickRecords;
    private List<String> inactiveUserList;

    /**
    *@Description: Constructor method with no args, to be called from Batch class - deleteClicks_Batch_cmeraki
    *@Params: None
    */
    public deleteClicksService_cmeraki(){}
    

    /**
    *@Description: Constructor method with args, to be called from delete_ifUserInactive method of the current class.
    *@Params: String[] of inactive user names
    */
    public deleteClicksService_cmeraki(List<String> inactiveUserList){
        this.inactiveUserList = inactiveUserList;
    }

    /**
    *@Description: Execute method of Queueable interface to be implemented
    *@Params: queueable job id
    */
    public void execute(QueueableContext qc){
        this.processClicks(inactiveUserList);
    }

    /**
    *@Description: Contains core logic to delete all click records associated to the current list of users being de-actiavted
    *@Params: String[] of inactive user names
    *@Override: over-riding the abstract method of Clicks_cmeraki
    */
    public override void delete_ifUserInactive(List<String> inactiveUserList){
         System.enqueuejob(new deleteClicksService_cmeraki(inactiveUserList));
    }

    public void processClicks(List<String> inactiveUserList){
        
        clickRecords = new List<Click__c>();
        system.debug('user list value:  '+inactiveUserList);
        system.debug('query value:'+[SELECT Id, Clicked_By_User__c, TimeStamp__c,OwnerId FROM Click__c WHERE Clicked_By_User__c <> NULL]);

        /**
        *@Query: using ownerid as owner is indexed. 
        */
        for(Click__c clkRecord: [SELECT Id, Clicked_By_User__c, TimeStamp__c FROM Click__c WHERE OwnerId IN: inactiveUserList AND Clicked_By_User__c <> NULL]){
            clickRecords.add(clkRecord);
        }

        system.debug('recs to delete'+clickRecords);
        if(clickRecords <> null)
            delete clickRecords;
    }
}