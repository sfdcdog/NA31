public class ctrec2 extends VirtualTest{

    public Integer x;

    //overrides a virtual method of virtual class
    public override string createRecods(List<Case> csList){
        return 'test';
    }
    //no override of non-virtual&non-abstract method of virtual class
    /*public string ctrec(){
        return 'test';
    }*/
    
    //overrride no return type virtual method of virtual class
    public override void ctrecr2(){
        x = 2+3;

    }
    
    public override string updaterecs(){
        return 'teset';
    }
}