import { api, LightningElement, track } from 'lwc';

export default class RefreshedChildProperties extends LightningElement {
    @api receivedProperty;
    @api newVal = this.receivedProperty;
    
}