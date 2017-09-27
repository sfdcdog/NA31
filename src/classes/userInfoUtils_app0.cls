public class userInfoUtils_app0{
    

    private static User UserInContext;


    /***System Methods***/
    public static String getFirstName(){
        return UserInfo.getFirstName();
    }

    public static String getName(){
        return UserInfo.getName();
    }
    
    public static String getOrganizationName(){
        return UserInfo.getOrganizationName();
    }

    public static String getProfileId(){
        return UserInfo.getProfileId();
    }

    public static String getUserEmail(){
        return UserInfo.getUserEmail();
    }

    public static String getUserId(){
        return UserInfo.getUserId();
    }

    public static String getUserName(){
        return UserInfo.getUserName();
    }

    public static String getUserRoleId(){
        return UserInfo.getUserRoleId();
    }

    public static String getUserType(){
        return UserInfo.getUserType();
    }

    /***Custom Methods***/  
    public static String getUserProfileName(){
        String profileName = profileName();
        return profileName;
    }

    private static User getUserRecord(){
        String userId = getUserId();
        return UserInContext = [SELECT Id, Name, ProfileId, Profile.Name FROM User WHERE id =: userId]; 
    }

    private static String profileName(){
        User userInContext =  getUserRecord();
        Id profileId = getProfileId();
        String UserProfile;
        
        if(userInContext.ProfileId == profileId)
            UserProfile  = userInContext.Profile.Name;
        
        return UserProfile;
    }
}