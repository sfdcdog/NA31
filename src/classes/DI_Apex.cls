/*

    Copyright (c) 2017 JRK.  All rights reserved.
    This program is free software: you can redistribute it and/or modify
    it under the terms of the License DEFINED.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY.
    
*/
public class DI_Apex{
    
    public String testDI(DI_PaymentInterface serviceInstance){
        DI_PaymentInterface payment = serviceInstance;
        return payment.processPayment();
        
        //System.debug('1'+payment.processPayment());
    }
}