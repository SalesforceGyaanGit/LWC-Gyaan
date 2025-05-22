import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import CASE_NOTIFY from '@salesforce/messageChannel/CaseNotification__c';

export default class NewCaseForm extends LightningElement {
    @wire(MessageContext) messageContext;

    handleSubmit() {
        // Simulating new case
        const payload = { type: 'NewCase', message: 'A new case was created!' };
        publish(this.messageContext, CASE_NOTIFY, payload);
    }
}