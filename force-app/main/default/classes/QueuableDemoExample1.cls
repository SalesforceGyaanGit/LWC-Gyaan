public class QueuableDemoExample1 Implements Queueable{
    public void execute(QueueableContext qx)
    {
        contact c = new contact();
        c.FirstName = 'con1';
        c.LastName = 'sgyaan';
        INSERT c;
        
        ID jobId = System.enqueueJob(new QueuableDemoExample2());
		system.debug('Job Id of QueuableDemoExample2 is == '+jobId);
    }
}