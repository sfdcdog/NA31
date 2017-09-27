@isTest 
public class Mock_DateHelperTest {   
    @isTest 
    public static void testGetHelperDate() {
        // Create a mock version of the  Mock_DateHelper class.
        Mock_DateHelper mockDH = new Mock_DateHelper();

        
        // Use the mocked object in the test.
        System.assertEquals('5/5/2017', mockDH.getTodaysDate());
    }
}