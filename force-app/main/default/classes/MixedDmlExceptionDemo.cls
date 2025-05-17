public class MixedDmlExceptionDemo {
    public static void CreateSetupAndNonSetupRecord()
    {
        Profile P = [SELECT Id FROM PROFILE WHERE Name = 'Standard User - Custom Profile'];
        UserRole userRole = [Select Id,Name from UserRole WHERE name = 'Developer' LIMIT 1];
        
        User u = new user();
        u.LastName = 'Test Code1';
        u.Email = 'ptest2@test.com';
        u.Alias = 'Tcode1';
        u.Username = 'ptest2@sgyaan.com';
        //u.CommunityNickname = 'test12';
        u.LocaleSidKey = 'en_US';
        u.TimeZoneSidKey = 'GMT';
        u.ProfileID = P.Id;
        u.UserRoleId = userRole.Id;
        u.LanguageLocaleKey = 'en_US';
        u.EmailEncodingKey = 'UTF-8';
        INSERT u;
        
        createAccount();
                
    }
    @future
    public static void createAccount()
    {
        Account a = new Account();
        a.Name = 'Prashant Account';
        INSERT a;
    }
}