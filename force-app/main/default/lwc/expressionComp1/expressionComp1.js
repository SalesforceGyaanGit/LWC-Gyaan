import { LightningElement } from 'lwc';

export default class ExpressionComp1 extends LightningElement {
    CompanyName = 'Salesforce Gyaan';
    Website = 'www.salesforcegyaan.com';
    contact = '7020694830';
    Newcontact;

    changeContact(event)
    {
        console.log('I am in changeContact method');
        console.log('Entered value is',event.target.value);
        this.Newcontact = event.target.value;
    }
}