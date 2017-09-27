public class runQueueable_app0 implements Queueable{
        
        private List<sObject> sObjectList;
        private String AsyncOp;
        
        public runQueueable_app0(List<Sobject> sObjectList, String AsyncOp){
            this.sObjectList = sObjectList;
            this.AsyncOp = AsyncOp;
        }

        public void execute(QueueableContext qc){
            new process_Async_app0(AsyncOp).processAccounts(sObjectList);
        }
    }