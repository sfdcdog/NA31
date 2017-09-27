public virtual class VirtualTest{
    
    //virtual methods cannot be static
    /*public virtual static string createRecods(List<Case> csList){
        return 'test';
    }*/
    
    //virtual method with return type in virtual class
    public virtual string createRecods(List<Case> csList){
    return 'test';
    }
    
    //non-virtual, non-abstract method in virtual class
    public string ctrec(){
        return 'test';
    }
    //virtual method in a virtual class
    public virtual void ctrecr2(){

    }
    
    public virtual string updaterecs(){
        return 'test';
    }
}