public class AccountController_Factory_app0{
    
    public static AccountController_app0 AccountController_Service_app0(string serviceName){
       AccountController_app0 validations = (AccountController_app0)new DI_ServiceContainer(new DI_ServiceFactory(), new DI_ServiceRepo()).getInstance(serviceName).newInstance(); 
       return validations;
    }

    public static AccountController_app0 AccountController_Async_Service_app0(string serviceName){
       AccountController_app0 asyncOperation = (AccountController_app0)new DI_ServiceContainer(new DI_ServiceFactory(), new DI_ServiceRepo()).getInstance(serviceName).newInstance(); 
       return asyncOperation;
    }

}