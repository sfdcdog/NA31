public with sharing class TestVF{
    
    //instance variables
    public string inputTextValue{
        get{
            return inputTextValue;
        }
        set{
           inputTextValue = value;
        }
    }
    
    public string inputTextValue2{
        get{
            return inputTextValue2;
        }
        set{
           inputTextValue2 = value;
        }
    }
    
    public string inputTextValue3{
        get{
            return inputTextValue3;
        }
        set{
          inputTextValue3 = 'yes';         
        }
    }
    
    //Extension Constructor always has standard controller parameter passed 
    public TestVF(ApexPages.StandardController stdcontroller){
        inputTextValue = 'Enter Name';
        inputTextValue2 = 'PlaceHolder';
    }
    
    //Constructor [polymorphism] - called as part of 
    public TestVF(){
        inputTextValue = 'Enter Name';
        inputTextValue2 = 'PlaceHolder';
    }

}