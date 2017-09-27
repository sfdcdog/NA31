public class AccountController_Service_app0 extends AccountController_app0{

    private String userProfileInContext;


    public AccountController_Service_app0(){
        userProfileInContext = userInfoUtils_app0.getUserProfileName();
    }

    public override String accountValidations(){
        
        String result;
        
        //always use a custom Setting - directly specifying profile name for readality
        if(userProfileInContext == 'System Administrator'){
            result = 'UNLOCK_FOR_SYSADMIN';
        }

        return result;
    }
    
    public override void deleteValidations(){
    
    }
}