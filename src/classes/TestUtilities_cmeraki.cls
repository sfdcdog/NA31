/**
*@Class: TestUtilities_cmeraki
*@Type: Test Utilities Class
*@Description: This class has methods that return instances of Objects to create test data and for Load Testing
*/
@isTest
public class TestUtilities_cmeraki{

    public static User testUser = [SELECT id, Name, isActive FROM User WHERE name = 'Agent FAE' LIMIT 1];

    public static List<User> getUsers(integer noOfUsers){
        Profile prof = [select id, name from Profile where name = 'System Administrator' limit 1];
        

        List<User> userRecList = new List<User>();
        for(Integer i=1; i<=noOfUsers; i++){
            User userRec = new User(
                LastName='Yamaha'+i,
                FirstName='R1',
                Email = i+'ryo@redsuns.com',
                UserName = i+'keisuke@redsuns.com',
                isActive = true,
                Alias = 'RedSuns',
                profileId = prof.Id,  
                EmailEncodingKey ='UTF-8',
                LanguageLocaleKey = 'en_US',
                LocaleSidKey = 'en_US',
                TimeZoneSidKey = 'America/Los_Angeles' 
            );
            userRecList.add(userRec);
        }
        return userRecList;
    }


    public static void insert_deleteClickService(){
            DIService__c deleteClicksService = new DIService__c(
                Label__c = 'deleteClicksService_cmeraki',
                Name = 'deleteClicksService_cmeraki'
            );
        
        insert deleteClicksService;
    }


    
    public static List<Click__c> getClicks(integer noOfClicks){
        List<Click__c> clickRecList = new List<Click__c>();
        for(Integer i=1; i<=noOfClicks; i++){
            Click__c clickRec = new Click__c(
                TimeStamp__c = string.valueOf(System.now()),
                Clicked_By_User__c = testUser.Name,
                OwnerId = testUser.id
            );
            clickRecList.add(clickRec);
        }
        return clickRecList;
    }

}