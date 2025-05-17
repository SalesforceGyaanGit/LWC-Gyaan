public class IfElseDemo {
    public static void checkAge()
    {
    	Integer a = 30;
        Integer p = 30;
        Integer r = 32;
        Integer x = 31;
        
        String age = (x > a ? ((x > p)?((x > r ? 'X is greater than r':'r is greater than X')):' P is greater than x'):'a is elder');
        system.debug('Age is == '+age);
        
        /*if(Amit_age > Prashant_age)
        {
            system.debug(' Amit is elder than Prashant');
        }
        else if(Prashant_age > Amit_age)
        {
            system.debug(' Amit is not elder than Prashant');
        }
        else if(Prashant_age > Rahul_age )
        {
            system.debug(' Rahul_age is not elder than Prashant');
        }
        else if(Prashant_age > Pranit_age )
        {
            system.debug(' Pranit_age is not elder than Prashant');
        }
        else
        {
            system.debug('******************');
        }*/
    }
}