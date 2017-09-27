/**
*@description - example to show that initialization code block runs before constructor code
*/
public class Example_InitializationCodeBlock{

    /**
    *order number 2
    *@description - instance variables
    */
    public List<Integer> intvalue;
    public String[] stringvalue;
    
    /**
    *@description - class constructor
    */
    public Example_InitializationCodeBlock(){
        stringvalue = new String[]{'Test1','Test2'};
    }
    
    /**
    *@order number 1
    *@description - INITIALIZATION CODE BLOCK
    */
    {
        intValue = new List<Integer>();
        intValue.add(10);
       
    }
    
}