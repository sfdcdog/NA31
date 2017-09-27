public class CTx1{
    
    public static XT service1;
    public static XT service2;
    
    public CTx1(){

    }

    public static string virMethod1XTa(){
        service1 = new XTa();
        List<String> clients = service1.abMethod1('CTx1');
        
        String value = service1.virMethod1();
        return value;
    }

    public static string virMethod1XTb(){
        service2 = new XTb();
        List<String> clients = service2.abMethod1('CTx1');
        
        String value = service2.virMethod1();
        return value;
    }



}