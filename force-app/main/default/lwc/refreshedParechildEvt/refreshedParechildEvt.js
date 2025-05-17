import { LightningElement, track } from 'lwc';

export default class RefreshedParechildEvt extends LightningElement {
    @track receivedValFromChild;

    handleValueFromChild(event){
        this.receivedValFromChild = event.detail;
    }
}