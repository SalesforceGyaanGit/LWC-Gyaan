trigger AccountTrg on Account (before delete,before Insert) {
    if(trigger.IsBefore && trigger.IsDelete)
    {
        AccountTrgHandler.preventDeletion(trigger.old);        
    }
}