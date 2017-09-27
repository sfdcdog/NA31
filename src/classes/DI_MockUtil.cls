public class DI_MockUtil {
    private DI_MockUtil(){}

    public static DI_MockProvider getInstance() {
        return new DI_MockProvider();
    }
    
     public static Object createMock(Type typeToMock) {
        // Invoke the stub API and pass it our mock provider to create a 
        // mock class of typeToMock.
        return Test.createStub(typeToMock, DI_MockUtil.getInstance());
    }
}