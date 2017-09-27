/*

    Copyright (c) 2017 JRK.  All rights reserved.
    This program is free software: you can redistribute it and/or modify
    it under the terms of the License DEFINED.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY.
    
*/
public class DI_ServiceRepo{

    private Map<String, Type> infObj = new Map<String, Type>();
    private Map <String, DIService__c> serviceMap = DIService__c.getAll();

    public DI_ServiceRepo(){
        for(String key: serviceMap.keyset()){
            system.debug('1111111111111111'+infObj);
            system.debug('type??????'+Type.forName(key));
            infObj.put(key, Type.forName(key));
            system.debug('2222222222'+infObj);
        }
    }   
    public void add(String service, Type Instance){
        infObj.put(service, Instance);
        system.debug('ttttttttttttttt'+infObj);

        //Creating custom setting record
        DIService__c ds = new DIService__c();
            ds.Name = service;
            ds.Label__c = service;
        insert ds;
        system.debug('new DS Rec'+ds);
    }

    public Type getInterface(String service){
        if(infObj <> null){
        system.debug('uuuuuuuuuuuuuu'+infObj);
            system.debug('return to container'+infObj.get(service));
            return infObj.get(service);
        }else{
            return null;
        }
        
    }

}