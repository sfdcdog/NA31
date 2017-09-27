/**
*@Class: Clicks_Factory_cmeraki
*@Type: Factory Class - which creates objects of the Service class passed as parameter.
*@Description: This returns an instance of the service class passed as parameter
*/
public class Clicks_Factory_cmeraki{
    
    public static Clicks_cmeraki deleteClicks(string serviceName){
       Clicks_cmeraki deleteClicksService = (Clicks_cmeraki)new DI_ServiceContainer(new DI_ServiceFactory(), new DI_ServiceRepo()).getInstance(serviceName).newInstance(); 
       return deleteClicksService;
    }

}