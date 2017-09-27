public class CaseDIFactory{

    public static CaseHandler ValidationService(string serviceName){
       CaseHandler csHandler = (CaseHandler)new DI_ServiceContainer(new DI_ServiceFactory(), new DI_ServiceRepo()).getInstance(serviceName).newInstance(); 
       return csHandler;
    }

    public static CaseHandler ContactCreationService(string serviceName){
       CaseHandler csHandler = (CaseHandler)new DI_ServiceContainer(new DI_ServiceFactory(), new DI_ServiceRepo()).getInstance(serviceName).newInstance(); 
       return csHandler;
    }
 }