public class QueuableDemo Implements Queueable{
    public void execute(QueueableContext qx)
    {   
        // It returns job ID
        // It supports job chaining
        system.debug('I am in Execute method of QueuableDemo ');
        UtilityDemo.createAccountRecs();
    }
}