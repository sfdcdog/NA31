/***************************************************************************************************
Apex Trigger Name:  Core_ContactTrigger
Version     : 1.0 
Created Date: 17 August 2015
Function    : Trigger for the object Contact
Modification Log :
* Developer                   Date                   Description
* ----------------------------------------------------------------------------                 
☠ JRK    

****************************************************************************************************/

trigger Core_ContactTrigger on Contact (after insert, after update, after delete, before insert, before update, before delete) {
    if(trigger.isBefore){
        //Core_Contact_Dispatcher.beforeMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
    if(trigger.isAfter){
        //Core_Contact_Dispatcher.afterMethod(trigger.old, trigger.new, trigger.oldMap, trigger.newMap);
    }
}