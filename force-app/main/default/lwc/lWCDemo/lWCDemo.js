import { LightningElement, track } from 'lwc';

export default class LWCDemo extends LightningElement {
    @track ip1;
    @track ip2;
    @track count=0;
    @track count2 = 0;
    @track mincount=0;
    @track maxcount=0;
    handleInput1(event)
    {
        this.ip1 = event.target.value;
        console.log('this.ip1 === '+this.ip1);
        if(this.ip1 == 'A')
        {
            console.log('I am in A')
            this.count = 1;
        }
        else if(this.ip1 == 'AB')
        {
            console.log('I am in AB')
            this.count = 1+2;
        }
        else if(this.ip1 == 'ABC')
        {
            console.log('I am in ABC')
            this.count= 1+2+3;
        }
        console.log('count == '+this.count);
    }
    handleInput2(event)
    {
        this.ip2 = event.target.value;
        console.log('this.ip1 === '+this.ip2);
        if(this.ip2 == 'D')
        {
            console.log('I am in D')
            this.count2 = 4;
        }
        else if(this.ip2 == 'DE')
        {
            console.log('I am in DE')
            this.count2 = 4+5;
        }
        else if(this.ip2 == 'DEF')
        {
            console.log('I am in DEF')
            this.count2= 4+5+5;
        }
        console.log('count == '+this.count);
    }
    getRange(event)
    {
        console.log('I am in get Range');
            this.mincount = parseInt(this.count)+5;  //11
            this.maxCount = parseInt(this.count)-5; 
          console.log('mincount is == '+mincount);
          console.log('maxCount is == '+maxCount);
    }
}