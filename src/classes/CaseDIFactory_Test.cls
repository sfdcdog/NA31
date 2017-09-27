@isTest 
public class CaseDIFactory_Test {   
    @isTest 
    public static void ValidationService() {
        // Create a mock version of the  Mock_DateHelper class.        
        CaseHandler mockPS = (CaseHandler)DI_MockUtil.createMock(CaseHandler_ValidationService.class);
        List<Case> csList = [SELECT id FROM Case LIMIT 2];
        //CaseDIFactory dp = new CaseDIFactory();
        System.assertEquals('XX', CaseDIFactory.ValidationService(mockPS, csList));
    }
    
    @isTest 
    public static void createRecordsService() {
        // Create a mock version of the  Mock_DateHelper class.        
        CaseHandler mockPS = (CaseHandler)DI_MockUtil.createMock(CaseHandler_createRecordsService.class);
        List<Case> csList = [SELECT id FROM Case LIMIT 2];
        //CaseDIFactory dp = new CaseDIFactory();
        System.assertEquals('XX', CaseDIFactory.ContactCreationService(mockPS, csList));
    }
}