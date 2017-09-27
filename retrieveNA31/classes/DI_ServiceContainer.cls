/*

    Copyright (c) 2017 JRK.  All rights reserved.
    This program is free software: you can redistribute it and/or modify
    it under the terms of the License DEFINED.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY.
    
*/
public class DI_ServiceContainer{

    private DI_ServiceRepo repo;
    private DI_ServiceFactory factory;
    public Type obj;

    public DI_ServiceContainer(DI_ServiceFactory f, DI_ServiceRepo r){
        this.repo = r;
        this.factory = f;
    }

    public Type getInterface(String service){
        system.debug('xxxxxxxxxxxx'+repo);        
        system.debug('yyyyyyyyyyyyyy'+factory);
        obj = repo.getInterface(service);
        system.debug('zzzzzzzzzzzzzzzzzzzzz'+obj); 
        if(obj <> null){
            return obj;            
        }else{
            obj = factory.createInterface(service);
            repo.add(service, obj);
            return obj;
        }

        
    }

}