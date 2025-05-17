import { LightningElement } from 'lwc';

export default class ChildCustomEventComponent extends LightningElement {
    
    changeVal(event)
    {
        const Name = event.target.value;  // ex. IPhone 15
        //Customeevent name should be in Lower Case - eg. passownername
        const custEvt = new CustomEvent('passownername',
        {
            detail:Name,bubbles: true
        });    // We have create an event here

        this.dispatchEvent(custEvt);   // Dispatched Event
    }
}