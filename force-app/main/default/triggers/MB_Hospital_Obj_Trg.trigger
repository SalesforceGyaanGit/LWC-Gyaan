trigger MB_Hospital_Obj_Trg on Hospital__c (before insert,after insert,before update, after update, before delete, after delete, after undelete) 
{
    if(trigger.IsInsert && trigger.IsBefore)
    {
        // Call before Insert method from this context
        // Before Insert supports only Trigger.New, and trigger.new is a list
        MB_Hospital_Obj_TrgHandler.BeforeInsertDemo(trigger.New);
    }
    else if(trigger.IsInsert && trigger.IsAfter)
    {
        // call After Insert method from this context
        // // Before Insert supports Trigger.New and Trigger.NewMap
        //MB_Hospital_Obj_TrgHandler.AfterInsertDemo(Trigger.New);
        MB_Hospital_Obj_TrgHandler.AfterInsertMapDemo(Trigger.NewMap);
    }
    else if(trigger.IsBefore && trigger.IsUpdate)
    {
        // call before Update method from this context
        //UtilityDemo.Undeleted = FALSE;
        system.debug('I am in before update trigger and value of UtilityDemo.Undeleted == '+UtilityDemo.IsUndeleted);
        if(UtilityDemo.IsUndeleted ==  FALSE)
        {
        	MB_Hospital_Obj_TrgHandler.BeforeUpdateDemo(trigger.new,trigger.old);    
        }
    }
    else if(trigger.IsAfter && trigger.IsUpdate)
    {
        // call After Update method from this context
        if(UtilityDemo.IsUndeleted ==  FALSE)
        {
        	MB_Hospital_Obj_TrgHandler.AfterUpdateDemo(trigger.oldmap, trigger.newmap);    
        }         
    }
    else if(trigger.IsBefore && trigger.IsDelete)
    {
        // call before Delete method from this context
        MB_Hospital_Obj_TrgHandler.BeforeDeleteDemo(Trigger.oldmap);
    }
    else if(trigger.IsAfter && trigger.IsDelete)
    {
        // call After Delete method from this context
        MB_Hospital_Obj_TrgHandler.AfterDeleteDemo(trigger.oldmap);
    }
    else if(trigger.IsAfter && trigger.IsUnDelete)
    {
        // call After UnDelete method from this context
        MB_Hospital_Obj_TrgHandler.AfterUnDeleteDemo(trigger.newmap);
    }
}