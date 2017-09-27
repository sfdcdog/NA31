@isTest
public class DI_MockProvider implements System.StubProvider{

    public Object handleMethodCall(Object stubbedObject, String stubbedMethodName, Type returnType, 
        List<Type> listofParamTypes, List<String> listofParamNames, List<Object> listofArgs){

        system.debug('Stubbed Object: '+ stubbedObject);
        system.debug('Stubbed Method Name: '+ stubbedMethodName);
        system.debug('Return Type: '+ returnType);
        system.debug('Return type of stubbed method: '+ returnType.getName());

        if (returnType.getName() == 'String')
            return 'XX';
        else 
            return null;

    }
}