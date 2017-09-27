public class DI_ServiceRepo{

    private Map<String, Type> instanceInCache = new Map<String, Type>();
    private Map <String, DIService__c> serviceMap = DIService__c.getAll();

    public DI_ServiceRepo(){

        for(String key: serviceMap.keyset()){
            instanceInCache.put(key, Type.forName(key));
        }
    }   
    public void add(String service, Type Instance){
        instanceInCache.put(service, Instance);

        //Creating custom setting record - bypass this line and create manually for avoiding mixedDML issue
        DIService__c ds = new DIService__c();
            ds.Name = service;
            ds.Label__c = service;
        insert ds;
        system.debug('new DS Rec'+ds);
    }

    public Type getInstance(String service){
        if(instanceInCache <> null)
            return instanceInCache.get(service);
        else
            return null;
        
        
    }

}