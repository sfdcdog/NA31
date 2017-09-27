/**
*@Why_are_variables_in_FunctionalProgramming_Immutable?
*@using_Instance_vs_Local_variables 
*/
public class Example_mutabilityTest{

    //instance variable
    public integer int1;

    public Integer mutabletest(integer val1){
        //assigning value to instance var
        int1  = val1;

        //creating and assigning value to local var
        Integer int2 = 3;

        system.debug('int1 value: '+int1);
        system.debug('int 2 value: '+int2);
        
        return int1;

    }

}

/**
*@Use_for_Testing
*@paste_the_below_code_in_AnonymousWindow_to_test
* Example_mutabilityTest tm1 = new Example_mutabilityTest();
* tm1.mutabletest(4);
* Example_mutabilityTest tm2 = new Example_mutabilityTest();
* tm2.mutabletest(5);
*/