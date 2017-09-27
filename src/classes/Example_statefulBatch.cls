public class Example_statefulBatch implements Database.Batchable<SObject>, Database.Stateful{

    public integer recordsProcessed = 0;
    public List<Account> accList;

    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator([SELECT id, Name, AccountSource, Core_IPS_Active__c FROM Account]);
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        try{
            this.accList = scope;
            //system.debug('accounts: '+accList);
            
            List<Account> accsForUpdate = new List<Account>();
            List<Integer> totalrecs = new List<Integer>();
            List<Database.Error> errorCount = new List<Database.Error>();

            for(Account acc: accList){
                //system.debug('accsource value:'+ acc.AccountSource);
                if(acc.AccountSource == 'Social Media'){
                    acc.AccountSource = 'Webinaris';    
                    system.debug('t/f'+acc.Core_IPS_Active__c);
                }
                if(acc.Core_IPS_Active__c){
                    acc.Core_IPS_Active__c = false;
                }
                accsForUpdate.add(acc);
            }
            
            system.debug('5th acc:'+ accsForUpdate[2]);
            Database.UpsertResult[] sResult = Database.Upsert(accsForUpdate,false);
            for(integer i = 0; i < sResult.size(); i++){
                if(sResult[i].isSuccess()){
                    totalrecs.add(recordsProcessed++);
                }else if(!sResult[i].isSuccess()){
                    Database.Error[] err = sResult[i].getErrors();
                    errorCount.add(err[0]);
                }
            }

            system.debug('no of recs processed:  '+ totalrecs.size());
            system.debug('no of errors processed:  '+ errorCount.size());

        }catch(Exception e){
            system.debug('ExceptionMessage: '+ e.getMessage());
        }
    }

    public void finish(Database.BatchableContext bc){}
    /*
    *https://github.com/SalesforceFoundation/Cumulus/blob/dev/src/classes/ADDR_GoogleGeoAPI_Validator.cls
    *https://github.com/SalesforceFoundation/Cumulus/blob/dev/src/classes/ADDR_GoogleGeoAPI_Validator_TEST.cls
    *https://github.com/SalesforceFoundation/Cumulus/blob/dev/src/classes/ADDR_MockGoogleGeoAPIResponse_TEST.cls
    */
}