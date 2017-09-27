public class UserUtils{

    //variables
    /*public static List<String> roleIds;
    private static List<String> roleNames;
    private static List<String> profileIds;
    private static List<String> profileNames;
    private static List<user> userRecords;
    public static List<String> usrroleNames;*/


    public UserUtils(){

    }

    public static List<String> getRoleInfo(List<String> roleinfo){
        List<String> usrRoleNames =  new List<String>();
        if(roleinfo <> null){
            
            for(UserInfo uinfo: getUserInfo(null, roleinfo,null)){
                usrRoleNames.add(uinfo.roleName);
            }
               
        }
        
        return usrRoleNames;   
    }

    public static List<String> getProfileInfo(List<String> profileinfo){
        List<String> usrProfileNames =  new List<String>();
        if(profileinfo <> null){
            
            for(UserInfo uinfo: getUserInfo(null, null, profileinfo)){
                usrProfileNames.add(uinfo.profileName);
            }
               
        }
        
        return usrProfileNames;   
    }

    public static List<UserInfo> getUserInfo(List<User> usrList, List<String> roles, List<String> profiles){
        List<User> users = new List<User>();
        List<UserInfo> userInfoList = new List<UserInfo>();
        if((usrList == null && profiles ==null) && roles <> null){
            users = getUserRecords(roles, 'UserRole');          
        }
        if((usrList == null && roles == null) && profiles <> null){
            users = getUserRecords(profiles, 'Profile');
            system.debug('usr list'+users);
        }
        

        if(users <> null){
            userInfoList = getUserInfoRecords(users);
        }

        return userInfoList;
    }

    private static List<UserInfo> getUserInfoRecords(List<User> usrList){
        List<UserInfo> userInfoList = new List<UserInfo>();
        for(User u: usrList){
            UserInfo uInfo = new UserInfo();
            uInfo.usrRecord = u;
            uInfo.userName = u.Name;
            uInfo.roleName = u.UserRole.Name;
            uInfo.profileName = u.Profile.Name;
            userInfoList.add(uInfo);
        }

        return userInfoList;
    }

    private static List<User> getUserRecords(List<String> inputStringList, String infoType){
        List<user> userRecords = new List<User>();
        List<String> roleIds = new List<String>();
        List<String> roleNames = new List<String>();
        List<String> profileIds = new List<String>();
        List<String> profileNames = new List<String>();

        if(inputStringList <> null && infoType <> null){
        	for(String s: inputStringList){
	            if(s.startsWith('00E') && infoType == 'UserRole'){
	                system.debug('here for roleid');
	                roleIds.add(s);
	            }else if(s.startsWith('00e') && infoType == 'Profile'){
	                system.debug('here for profileid');
	                profileIds.add(s);
	            }else if((!s.startsWith('00e')) && infoType == 'Profile'){
	                system.debug('here for profilename');
	                profileNames.add(s);
	            }else if((!s.startsWith('00E')) && infoType == 'UserRole' ){
	                system.debug('here for rolename');
	                roleNames.add(s);
	            }
	        }	
        }
        
        system.debug('xx'+profileIds);system.debug('ris'+roleIds);
        if(roleIds <> null){
            system.debug(roleIds);
            userRecords = [SELECT Id, Name, UserRole.Name, Profile.Name 
                           FROM User 
                           WHERE UserRoleId 
                           IN: roleIds 
                           LIMIT 10];
        }
        if(profileIds <> null){
            system.debug('YY'+profileIds);
            userRecords = [SELECT Id, Name, UserRole.Name, Profile.Name
                           FROM User 
                           WHERE ProfileId 
                           IN: profileIds];
            system.debug('YYZ'+userRecords);
        }
        if(profileNames <> null){
            userRecords = [SELECT Id, Name, UserRole.Name, Profile.Name FROM User WHERE Profile.Name IN: profileNames];
        }
        if(roleNames <> null){
            userRecords = [SELECT Id, Name, UserRole.Name, Profile.Name FROM User WHERE UserRole.Name IN: roleNames];
        }
        system.debug('YY1'+userRecords);
        return userRecords;
        
    }

    /*
    private static List<UserRole> getUserRoleRecords(String ){

    }

    private static List<Profile> getUserProfileRecords(String ){

    }
    */

    private class UserInfo{

        private User usrRecord;
        private String userName;
        private String roleName;
        private String profileName;
    } 
}