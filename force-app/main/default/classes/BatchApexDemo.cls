public class BatchApexDemo implements Database.Batchable<sObject>,Database.Stateful{
    //public string name;
    public set<string> ownerEmailSet = new set<String>();
    public Database.QueryLocator start(Database.BatchableContext bcx)
    {
        /*List<Hospital__c> hlist = new List<Hospital__c>();
        hlist = [SELECT ID,Name FROM Hospital__c];
        return hlist;*/  // --------------------------------------->   Wrong
        
        String q = 'SELECT ID,Name,createdBy.Name,createdBy.Email FROM Hospital__c';
        return Database.getQueryLocator(q);
    }
    public void execute(Database.BatchableContext bcx,List<Hospital__c> listOfRecs)
    {
        //Processing
        
        system.debug('I m in Execute method & the size of listOfRecs is == '+listOfRecs.size());
        List<Hospital__c> hlist = new List<Hospital__c>();
        For(Hospital__c h :listOfRecs)
        {
            h.Is_government_Authorized__c = true;
            ownerEmailSet.add(h.createdBy.Email);
            hlist.add(h);
        }
        system.debug('final records after adding into the list are == '+listOfRecs.size());
        try
        {
            if(!hlist.isempty())
            {
                system.debug('hlist is not empty & the size of hlist is == '+hlist.size());
                UPDATE hlist;
                system.debug('Records updated successfully');
            }
        }
        catch(Exception e)
        {
            system.debug('Exception is == '+e.getMessage());
        }
    }
    public void finish(Database.BatchableContext bcx)
    {
        system.debug('I am in finish method');
        system.debug('ownerEmailSet is =='+ownerEmailSet);
        
        UtilityDemo.sendEmail(ownerEmailSet,'Records Updated successfully','Hi Salesforce Gyaan, all the records are processed successfully');
        system.debug('Email alert method called');
    }
}