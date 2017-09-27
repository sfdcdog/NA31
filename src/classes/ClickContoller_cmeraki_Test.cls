/**
*@Class: ClickContoller_cmeraki_Test
*@Type: Test Class
*@Description: This class has methods for covering code under ClickContoller_cmeraki class. 
*/
@isTest
public class ClickContoller_cmeraki_Test{

    @isTest
    public static void createClickRecord_test(){
        String timeStamp = string.valueOf(System.now());
        
        PageReference pageref = Page.clickRecorder_cmeraki;
        Test.setCurrentPage(pageRef);

        String Id =  ClickContoller_cmeraki.createClickRecord(timeStamp);
        
    }

    private static String clickRecId;

}