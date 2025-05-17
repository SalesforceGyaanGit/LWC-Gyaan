import { LightningElement } from 'lwc';

export default class ChildThatFails extends LightningElement {
    connectedCallback() {
        throw new Error('🚨 Error from childThatFails component!');
    }
}
