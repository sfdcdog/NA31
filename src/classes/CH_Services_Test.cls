@isTest 
public class CH_Services_Test{   
    
    @isTest 
    public static void createRecords() {
        // Create a mock version of the  Mock_DateHelper class.        
        List<Case> csList = [SELECT id FROM Case LIMIT 2];         
        CaseHandler_createRecordsService createRecs = new CaseHandler_createRecordsService();
        System.assertEquals('records created', createRecs.createRecords(csList));
    }
    
    /*@isTest
    public static void validations(){
        List<Case> csList = [SELECT id FROM Case LIMIT 2];
        CaseHandler mockXPS = (CaseHandler)DI_MockUtil.createMock(CaseHandler_ValidationService.class);
        CaseHandler_ValidationService isValid = new CaseHandler_ValidationService();
        System.assertEquals('No errrors. is Valid', isValid.Validations(csList));     
    }*/

}