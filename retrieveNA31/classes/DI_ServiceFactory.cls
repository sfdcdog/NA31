/*

    Copyright (c) 2017 JRK.  All rights reserved.
    This program is free software: you can redistribute it and/or modify
    it under the terms of the License DEFINED.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY.
    
*/
public class DI_ServiceFactory{
    
    private Type inst;
    
    public Type createInterface(String service){
        inst = Type.forName(service);
        return inst;
    }
}