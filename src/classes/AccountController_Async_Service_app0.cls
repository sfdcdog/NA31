public class AccountController_Async_Service_app0 extends AccountController_app0{

    private String userProfileInContext;
    

    public AccountController_Async_Service_app0(){
        userProfileInContext = userInfoUtils_app0.getUserProfileName();
    }

    /**
    *@override_abstract_methods_as_empty_or_nulls
    */
    public override String accountValidations(){
        
        return null;
    }
    
    public override void deleteValidations(){
        
        //Empty method
    }

    /*************************************/

    public override void processAccounts_Async(List<Sobject> accountsList, String AsyncOp){
        

        if(AsyncOp == 'isQueueable')
            System.enqueuejob(new runQueueable_app0(accountsList, AsyncOp));
        if(AsyncOp == 'isBatchable')
            Database.executeBatch(new runBatch_app0(accountsList, AsyncOp));
    }

}