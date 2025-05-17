import { LightningElement } from 'lwc';

export default class ErrorGenerator extends LightningElement {
    connectedCallback() {
        throw new Error('Simulated crash from child!');
    }
}
