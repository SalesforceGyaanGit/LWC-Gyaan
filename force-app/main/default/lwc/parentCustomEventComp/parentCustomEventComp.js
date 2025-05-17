import { LightningElement, track } from 'lwc';

export default class ParentCustomEventComp extends LightningElement {
    @track ShowChildVal;
    /*handleMyChildEvent(event)
    {
        const receivedVal = event.detail;
        this.ShowChildVal = receivedVal;
    }*/
    constructor() {
        super();   
        this.template.addEventListener('passownername', this.handleCustomMyEvent.bind(this));
    }

    handleCustomMyEvent(event) {
        const textVal = event.detail;
        this.ShowChildVal = textVal;
    }
}