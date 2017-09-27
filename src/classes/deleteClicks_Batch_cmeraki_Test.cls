/**
*@Class: deleteClicks_Batch_cmeraki_Test
*@Type: Test Class
*@Description: This class has methods for covering code under deleteClicks_Batch_cmeraki class. 
*              Set the User Trigger to inactive when running the following Test.
*/
@isTest
public class deleteClicks_Batch_cmeraki_Test{
    
    public static List<User> userList;
    
    
    @isTest
    public static void getRecords(){
        userList = TestUtilities_cmeraki.getUsers(30);
        insert userList;

        /**
        *@IMPORTANT: Set the User Trigger to inactive when running the following Test.
        *@Alternative: Use a trigger SWITCH to stop the code to run on User Field Update.
        */
        for(User usr: userList){
            usr.isActive = false;
        }
        update userList;

    }

    @isTest
    public static void testBatch(){
        getRecords();
        
        Test.StartTest();
        deleteClicks_Batch_cmeraki batch = new deleteClicks_Batch_cmeraki();
        Database.executeBatch(batch);
        Test.StopTest();
    }
}