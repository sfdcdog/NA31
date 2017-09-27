public abstract class CaseHandler{

    public virtual string salesProfileValidations(List<Case> caseList){
        return 'No Over-Ride';
    }

    public virtual string adminProfileValidations(List<Case> caseList){
        return 'No Over-Ride';
    }

    public virtual string createRecords(List<Case> caseList){
        return 'No Over-Ride';
    }
    
    public virtual string processSubOptions(List<Case> caseList){
        return 'No Over-Ride';
    }
}