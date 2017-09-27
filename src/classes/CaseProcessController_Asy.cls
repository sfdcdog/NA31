public class CaseProcessController_Asy implements Queueable{

    private List<Case> caseList;

    public CaseProcessController_Asy(List<case> caseList){
        this.caseList = caseList;
    }

    public void execute(QueueableContext context){
        CaseHandler createContacts =  CaseDIFactory.ContactCreationService('CaseHandler_createRecordsService');
        String result  = createContacts.createRecords(caseList);
        system.debug('%%%%%'+result);
    }
}