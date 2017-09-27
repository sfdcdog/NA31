public with sharing class CaseProcessController{


    //http://salesforcecodes.blogspot.com/2016/05/reusable-pagination-in-visualforce-page.html
    //static & transient variables

    //instance variables across methods
    public List<Case> casesInContext;
    public List<String> caseNumbersInContext{get;set;}
    public Boolean processSelectpgblk{get;set;}
    public Boolean createContactspgblk{get;set;}
    public List<Case> casePgList{get;set;}
    public List<caseWrapper> csWrapperList{get;set;}
    public String processType{get;set;}
    public Boolean isAvoidingDups = false;
    public Boolean istrackingFields = false;

    //properties    
    public List<SelectOption> processTypes{
        
        get{
            List<SelectOption> options = new List<SelectOption>();
            List<String> listOfProcesses = System.Label.DI_caseProcesses.split(';');
            for (String process: listOfProcesses){
                options.add(new SelectOption(process, process));
            }
            return options;
        } 
        set;
    }


    //constructor
    public CaseProcessController(){
        processSelectpgblk = true;
        createContactspgblk = false;
        casePgList = [SELECT id, CaseNumber, Account.Name, Asset.Name, Owner.Name, CreatedBy.Name,
                             Description, Status, Subject, Type
                      FROM Case
                      LIMIT 25];
        
    }

    //Methods
    /***********************************************/

    public void procType(){
        system.debug('###@'+processType);
        if(processType == 'CreateContacts'){
            processSelectpgblk = false;
            createContactspgblk = true;
        }
    }
    
    public void avoidContactDuplicates(){
        if(isAvoidingDups == false){
            isAvoidingDups = true;
        }else{
            isAvoidingDups = false;
        }
    }
    
    public void trackFieldHistory(){
        if(istrackingFields == false){
            istrackingFields = true;
        }else{
            istrackingFields = false;
        }        
    }
    
    public List<caseWrapper> getCasesforContactCreate(){
        csWrapperList = new List<caseWrapper>();
        
        for(Case cs: casePgList){
            caseWrapper csWrapper = new caseWrapper();
            csWrapper.selected = false;
            csWrapper.selectedCase = cs;
            csWrapper.Id = cs.Id;
            csWrapper.CaseNumber = cs.CaseNumber;
            csWrapper.Account = cs.Account.Name;
            csWrapper.Asset = cs.Asset.Name;
            csWrapper.Owner = cs.Owner.Name;
            csWrapper.CreatedBy = cs.CreatedBy.Name;
            csWrapper.Description = cs.Description;
            csWrapper.Status = cs.Status;
            csWrapper.Subject = cs.Subject;
            csWrapper.Type = cs.Type;
            csWrapperList.add(csWrapper);
        }
        if(csWrapperList <> null){
            return csWrapperList;
        }else{
            return null;
        }
        
    }

    public PageReference processCasesSelected(){

        if(csWrapperList <> null){
            casesInContext = new List<Case>();
            for(caseWrapper cs: csWrapperList){
                if(cs.selected == true){
                system.debug('1##############'+isAvoidingDups+': 2##############'+istrackingFields);
                system.debug('$$$$$$$$$$$$$$$'+cs);
                    casesInContext.add(cs.selectedCase);
                }
            }
        }
        system.debug('$$$$$$$$$$$$$$$'+casesInContext);
        if(casesInContext <> null){
            createRecords(casesInContext);
            processSubOptions(casesInContext);   
        }
        
         return new PageReference('/home/home.jsp');
        
    }

    public void createRecords(List<Case> caseList){
        
        CaseProcessController_Asy asyncCreateContacts = new CaseProcessController_Asy(caseList);
        System.enqueueJob(asyncCreateContacts);
       
    }

    public void processSubOptions(List<Case> caseList){

        CaseProcessController_SubOptions_Asy asyncProcessSubOptns = new CaseProcessController_SubOptions_Asy(caseList);
        System.enqueueJob(asyncProcessSubOptns);
    }

    public class caseWrapper{

        public boolean selected{get;set;}
        public Case selectedCase{get;set;}
        public String CaseNumber{get;set;}
        public String Account{get;set;}
        public String Asset{get;set;}
        public String Owner{get;set;}
        public String CreatedBy{get;set;}
        public String Description{get;set;}
        public String Status{get;set;}
        public String Subject{get;set;}
        public String Type{get;set;}
        public String Id{get;set;}
    }


}