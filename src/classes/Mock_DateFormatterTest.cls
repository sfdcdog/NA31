@isTest 
public class Mock_DateFormatterTest {   
    @isTest 
    public static void testGetFormattedDate() {
        // Create a mock version of the  Mock_DateHelper class.
        Mock_DateHelper mockDH = (Mock_DateHelper)MockUtil.createMock(Mock_DateHelper.class);
        Mock_DateFormatter df = new Mock_DateFormatter();
        system.debug('#######'+mockDH);
        
        // Use the mocked object in the test.
        System.assertEquals('Today\'s date is 8/8/2016', df.getFormattedDate(mockDH));
    }
}