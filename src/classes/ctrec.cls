public class ctrec extends AbstractTest{
    
    //overrides an abstract method of abstract class
    public override string createRecods(List<Case> caseList){
        return 'Over-Ride';
    }
        
    
    //no override of a non-virtual, non-abstract method of abstract class
    /*public string ctrec(){
        return 'test';
    }*/
    
    //override of a virtual method of abstract class
    public override string ctrec2(){
        return 'Over-Ride';
    }
    
}