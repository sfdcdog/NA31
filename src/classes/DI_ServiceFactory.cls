public class DI_ServiceFactory{
    
    private Type inst;
    
    public Type createInstance(String service){
        inst = Type.forName(service);
        return inst;
    }
}