public class ScheduleBatchApexDemo implements Schedulable {
    public void execute(SchedulableContext SC)
    {
        ID BatchJobId = Database.executeBatch(new BatchApexDemo(),500);
        system.debug('BatchJobId is == '+BatchJobId);
    }
}

// There are 2 ways to schedule this batch class
// 1. UI
// 2. CRON Expression