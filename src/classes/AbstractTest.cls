public abstract class AbstractTest{
    
    //abstract method in an abstract class
    public abstract string createRecods(List<Case> csList);
    
    //non-virtual, non-abstract method in abstrcat class
    public string ctrec(){
        return 'test';
    }
    //virtual method in an abstract class
    public virtual string ctrec2(){
        return 'test';
    }
}