public class CaseTriggerHandler{

    public static void beforeInsertCalls(List<Case> newList,Map<Id,Case> newMap){
        
        //CurrentUserProfile
        String profileName = ([SELECT Id, Name FROM Profile WHERE id =: Userinfo.getProfileId()]).Name;
        if(profileName.contains('Sales')){
            system.debug('Trigger Handler CPU Time - beforeInsert 1: '+ Limits.getCpuTime());
            CaseHandler isValid =  CaseDIFactory.ValidationService('CaseHandler_ValidationService');
            String result  = isvalid.salesProfileValidations(newList);
            system.debug('$$$$'+result);
            system.debug('Trigger Handler CPU Time - beforeInsert 2: '+ Limits.getCpuTime());    
        }

        if(profileName.contains('Admin')){
            system.debug('Trigger Handler CPU Time - beforeInsert 1: '+ Limits.getCpuTime());
            CaseHandler isValid =  CaseDIFactory.ValidationService('CaseHandler_ValidationService');
            String result  = isvalid.adminProfileValidations(newList);
            system.debug('$$$$'+result);
            system.debug('Trigger Handler CPU Time - beforeInsert 2: '+ Limits.getCpuTime());   
        }
        
    }

    public static void beforeUpdateCalls(List<Case> oldList, List<Case> newList, Map<Id,Case> oldMap, Map<Id,Case> newMap){
        
    }

    public static void beforeDeleteCalls(List<Case> oldList, Map<Id,Case> oldMap){
        
    }

    public static void afterInsertCalls(List<Case> newList,Map<Id,Case> newMap){
        system.debug('Trigger Handler CPU Time - after Insert 1: '+ Limits.getCpuTime());
        CaseHandler createContacts =  CaseDIFactory.ContactCreationService('CaseHandler_createRecordsService');
        String result  = createContacts.createRecords(newList);
        system.debug('%%%%%'+result);
        system.debug('Trigger Handler CPU Time - after Insert 2: '+ Limits.getCpuTime());
    }

    public static void afterUpdateCalls(List<Case> oldList, List<Case> newList, Map<Id,Case> oldMap, Map<Id,Case> newMap){
        
    }
}