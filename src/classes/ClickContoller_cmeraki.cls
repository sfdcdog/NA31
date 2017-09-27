/**
*@Class: ClickContoller_cmeraki
*@Type: Controller Class
*@Description: This class creates a Click Record for every click and takes in timestamp as param
*              The method is remoteaction annotated as the VF Page uses JS Remoting.
*/
public with sharing class ClickContoller_cmeraki{

    //variables
    private static string clickRecId;
    public static String logFile{get;set;}


    /**
    *@Description: This method takes the timesatmp as param and creates the click record on every click
    *             
    */
    @RemoteAction
    public static String createClickRecord(String timeStamp, String logFile){

        Click__c clk = new Click__c();
        clk.TimeStamp__c = timeStamp;
        clk.LogFile__c = logFile;
        clk.Clicked_By_User__c = UserInfo.getName();

        try{
            Database.SaveResult result = Database.insert(clk,false);
            if (result != null){
                if (result.isSuccess()) {
                    clickRecId = result.getId();
                }               
            }
        }catch(Exception e){
            System.debug(e.getTypeName() + ' - ' + e.getCause() + ': ' + e.getMessage());
        }
        
        system.debug('id : '+clickRecId);
        
        if(clickRecId <> null){
            system.debug('comes here:');
            return clickRecId;   
        }else{ 
            return 'Error: no record was created'; 
        } 

    }

   @RemoteAction
    public static List<Click__c> getclicksList(){
        return [SELECT Name,Clicked_By_User__c,LogFile__c,TimeStamp__c FROM Click__c LIMIT 100];
    } 

}