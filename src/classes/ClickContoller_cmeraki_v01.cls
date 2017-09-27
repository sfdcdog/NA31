/**
*@Class: ClickContoller_cmeraki
*@Type: Controller Class
*@Description: This class creates a Click Record for every click and takes in timestamp as param
*              The method is remoteaction annotated as the VF Page uses JS Remoting.
*/
public with sharing class ClickContoller_cmeraki_v01{

    //variables
    private static string clickRecId;
    public static String logFile{get;set;}
    public string strclicksInfo{get;set;}

    public void debug(){
        system.debug('selected records'+strclicksInfo);
    }
    
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

    /*@RemoteAction
    public static List<Click__c> getclicksList(){
        return [SELECT Name,Clicked_By_User__c,LogFile__c,TimeStamp__c FROM Click__c LIMIT 100];
    }*/

    @RemoteAction
    public static List<clicksWrapper> getclicksList(){
        List<Click__c> existingClickRecords = [SELECT Name,Clicked_By_User__c,LogFile__c,TimeStamp__c FROM Click__c LIMIT 100];
        List<clicksWrapper> clickRecords = new List<clicksWrapper>();
        for(Click__c clk: existingClickRecords){
            clicksWrapper wrapper = new clicksWrapper();
            wrapper.selected = false;
            wrapper.clickRecord = clk;
            clickRecords.add(wrapper);
        }
        return clickRecords;
    }
    
    
    

    public class clicksWrapper{

        public boolean selected{get;set;}
        public Click__c clickRecord{get;set;}
    } 

}