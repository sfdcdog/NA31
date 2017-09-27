public class Class_A{

    //instance variables
    public integer i;
    public List<String> strList_00;

    //static variables
    public static integer j;
    public static List<String> strList_01;

    //instance methods
    public List<String> M1(){
    
        //instantiate list variable.
        strList_00 = new List<String>();
        
        //local variable
        String name = 'nalla Balu';
    
        //loop
        for(i = 0; i< 2; i++){
            strList_00.add(name);
        }

        //return value
        return strList_00;
    }

    public static List<String> M2(){
        
        //instantiate list variable
        strList_01 = new List<String>();
        
        //local variable
        String name = 'thella Balu';
        
        //loop
        for(j = 0; j< 2; j++){
            strList_01.add(name);
        }
        
        //return value
        return strList_01;
    }
}

/*
//instance result
Class_A A = new Class_A();
List<String> result = A.M1();
system.debug(result);

//static result
List<String> result = Class_A.M2();
system.debug(result);
*/