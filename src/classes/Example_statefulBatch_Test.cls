@isTest
public class Example_statefulBatch_Test{

    static List<Account> accList = new List<Account>();
    
    /**
    *@Note:We cannot test more than one execution of the execute method
    */
    public static TestMethod void getRecords(){
        //Inserting Accounts
        accList = getaccs(3); 
        insert accList; 
    }

    public static List<Account> getaccs(integer noOfaccs){

        List<Account> accRecList = new List<Account>();
        for(Integer i=1; i<=noOfaccs; i++){
            Account accRec = new Account(
                Name='Straw Hat'+i,
                AccountSource = 'Social Media',
                Core_IPS_Active__c = true
            );
            accRecList.add(accRec);
        }
        return accRecList;
    }

    public static testMethod void testBatch() {
        getRecords();
        

        Test.StartTest();
            Example_statefulBatch sBatch = new Example_statefulBatch();
            Database.executeBatch(sBatch);
            integer i=0;
            system.debug('Count'+i++);
        Test.StopTest();

    }

}