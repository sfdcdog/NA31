//Service Class 2
public class XTb extends XT{

    private static List<String> clients = new List<String>();

    //override abstract methods
    public override List<String> abMethod1(String clientName){
        List<String> clients = clientCallRecord(clientName);
        return clients;
    }

    private static List<String> clientCallRecord(String client){        
        clients.add(client);
        system.debug('list of clients'+clients);
        return clients;
    }

    //override virtual methods
    public override string virMethod1(){
        return 'call to virMethod1 of Service XTb';
    }
    
}