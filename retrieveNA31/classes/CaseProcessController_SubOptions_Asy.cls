public class CaseProcessController_SubOptions_Asy implements Queueable{

    private List<Case> caseList;

    public CaseProcessController_SubOptions_Asy(List<case> caseList){
        this.caseList = caseList;
    }

    public void execute(QueueableContext context){
        CaseHandler subOptions =  CaseDIFactory.ContactCreationService('CaseHandler_processSubOptnsService');
        String result  = subOptions.processSubOptions(caseList);
        system.debug('%%%%%'+result);
    }
}