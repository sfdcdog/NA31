public class runBatch_app0 implements Database.Batchable<sobject>{

    private List<sObject> sObjectList;
    private String AsyncOp;

    //Iterable Example - https://andyinthecloud.com/2013/08/11/batch-worker-getting-more-done-with-less-work/
    public runBatch_app0(List<Sobject> sObjectList, String AsyncOp){
        this.sObjectList = sObjectList;
        this.AsyncOp = AsyncOp;
    }

    public Iterable<sObject> start(Database.BatchableContext bc){
        return sObjectList;
    }


    public void execute(Database.BatchableContext bc, List<sObject> scope){
        new process_Async_app0(AsyncOp).processAccounts(sObjectList);
    }

    public void finish(Database.BatchableContext bc){}
}