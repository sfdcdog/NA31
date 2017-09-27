public with sharing class processAccountsController_app0{
    
    public List<AccountsWrapper> wrapListAccSection{get; set;}
    private transient boolean unlockMethod_SysAdmin;
    private transient String accQuery;
    public transient String searchText{get; set;}
    public transient String currentUser;

    public boolean displayTable{get; set;}
    public Integer size{get;set;}
    //public boolean displayAccessRestrictions;
    public List<SelectOption> AsyncOptions{get;set;}
    public String AsyncOption{get;set;}
     

    public processAccountsController_app0(){
        //initializing booleans
        displayTable = false;
        size = 5;
        AsyncOptions = new List<SelectOption>();
        AsyncOptions.add(new SelectOption('isQueueable', 'Queueable'));
        AsyncOptions.add(new SelectOption('isBatchable', 'Batchable'));

        //method calls
        //runValidations();
        //accQuery = 'SELECT ID,Name, AnnualRevenue, Createdby.name FROM Account'; //For testing lgtng pages
    }

    public void runValidations(){
        AccountController_app0 validationService = (AccountController_app0)AccountController_Factory_app0.AccountController_Service_app0('AccountController_Service_app0');
        String validationService_result = string.valueOf(validationService.accountValidations());

        if(validationService_result == 'UNLOCK_FOR_SYSADMIN'){
            unlockMethod_SysAdmin = true;       
        }   
    }

    public void searchAccounts(){
    stdAccountset = null;
    String accName = '%'+searchText+'%' ; //Using % wildcard after the search text for optimization.
    system.debug('######accname'+accName);
    currentUser = UserInfo.getName();
    system.debug('######name'+UserInfo.getName());
    accQuery = 'SELECT Id, AccountNumber, Name, AnnualRevenue, CreatedBy.Name, Parent.ID,Type FROM Account WHERE Name LIKE \''+accName+'\' AND CreatedBy.Name =:currentUser ORDER BY Name ASC NULLS LAST';        
    system.debug('######accquery'+accQuery);
    }

    //Using Standard Set Controller property for pagination.
    public ApexPages.StandardSetController stdAccountset{
        get{
            if(stdAccountset == null && accQuery <> null){
                stdAccountset = new ApexPages.StandardSetController(Database.getQueryLocator(accQuery));
                Integer accRecordsSize = stdAccountset.getResultSize();
                stdAccountset.setPageSize(size);
                system.debug('######rec size'+accRecordsSize);
            }                                                                                                                                                                                                                            
            return stdAccountset;
        }
        private set;
    }
    
    //Getter Method for displaying Accounts [paginated list]
    public List<AccountsWrapper> getAccounts(){
        wrapListAccSection = new List<AccountsWrapper>();
        system.debug('######accset'+stdAccountset);
        if(stdAccountset <> null){
            for(Account a: (List<Account>)stdAccountset.getrecords()){
                AccountsWrapper aWrap = new AccountsWrapper();
                aWrap.acc = a;
                aWrap.selected = false;
                wrapListAccSection.add(aWrap);
            }           
        }

        if(wrapListAccSection <> null && wrapListAccSection.size() > 0){
            system.debug('######wraplist'+wrapListAccSection);
            displayTable = true;
            return wrapListAccSection;

        }else{

            //displayTable = false;
            return null;
        }



    }


    public PageReference processAccounts(){
        List<sObject> accListtoUpdate = new List<sObject>();
        for(AccountsWrapper accWrap: wrapListAccSection){
            system.debug('unique$$$$'+accWrap);
            if(accWrap.selected){
                accListtoUpdate.add(accWrap.acc);
            }
        }

        AccountController_app0 asyncService = (AccountController_app0)AccountController_Factory_app0.AccountController_Async_Service_app0('AccountController_Async_Service_app0');
        asyncService.processAccounts_Async(accListtoUpdate, AsyncOption);
        
        
        return new PageReference('/home/home.jsp');
    }

    public class AccountsWrapper{

        public boolean selected{get;set;}
        public Account acc{get;set;}
    }
}