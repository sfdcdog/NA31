public class DI_ServiceContainer{

    private DI_ServiceRepo repo;
    private DI_ServiceFactory factory;
    public Type obj;

    public DI_ServiceContainer(DI_ServiceFactory f, DI_ServiceRepo r){
        this.repo = r;
        this.factory = f;
    }

    public Type getInstance(String service){
        obj = repo.getInstance(service);
        if(obj <> null){
            return obj;            
        }else{
            obj = factory.createInstance(service);
            repo.add(service, obj);
            return obj;
        }

        
    }

}