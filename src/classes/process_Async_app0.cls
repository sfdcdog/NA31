public class process_Async_app0{

    private String AsyncOp;

    public process_Async_app0(String AsyncOp){
        this.AsyncOp = AsyncOp;
    }

    public void processAccounts(List<sObject> accountsList){
        system.debug('The current Async process runs as:'+ AsyncOp);
        List<Account> updatedAccounts = new List<Account>();
        if(accountsList <> null){
            for(Account a: (List<Account>)accountsList){
                a.Name = 'Test';
                updatedAccounts.add(a);
            }
            Database.Update(updatedAccounts, false);
        }
    }

    public void processOpportunities(){

    }

    public void processCases(){

    }
}