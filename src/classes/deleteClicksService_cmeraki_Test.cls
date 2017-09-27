/**
*@Class: deleteClicksService_cmeraki_Test
*@Type: Test Class
*@Description: This class has methods for covering code under deleteClicksService_cmeraki class.
*/
@isTest
public class deleteClicksService_cmeraki_Test{

    public static List<User> userList;
    public static List<String> inactiveUserList;
    public static List<Click__c> clickRecList;

    /**
    *@Description: This method creates both customsetting records and click records.
    */
    @isTest
    public static void getRecords(){
        
        TestUtilities_cmeraki.insert_deleteClickService();
        

        clickRecList = TestUtilities_cmeraki.getClicks(3);
        insert clickRecList;
    }
    
    /**
    *@Description: This method is run as future, to avoid MIXED DML issue as we insert Click records above.
    */
    @future
    public static void user_InsertandUpdate(){ 
        
        User testUser = TestUtilities_cmeraki.testUser;

        if(testUser.isActive == true){
            testUser.isActive = false;
            update testUser;
        }
        

    }

    /**
    *@Description: This method makes calls to two different methods that create/update test data
    */
    @isTest
    public static void delete_ifUserInactive_test(){
        Test.StartTest();
        
        getRecords();

        user_InsertandUpdate();

        Test.StopTest();

    }
}