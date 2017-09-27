/*

    Copyright (c) 2017 JRK.  All rights reserved.
    This program is free software: you can redistribute it and/or modify
    it under the terms of the License DEFINED.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY.
    
*/
@isTest 
public class DI_Mock_ApexTest {   
    @isTest 
    public static void testApexDI() {
        // Create a mock version of the  Mock_DateHelper class.        
        DI_PaymentInterface mockPS = (DI_PaymentInterface)DI_MockUtil.createMock(DI_PaypalPaymentService.class);
        
        DI_Apex dp = new DI_Apex();
        System.assertEquals('XX', dp.testDI(mockPS));
    }
}