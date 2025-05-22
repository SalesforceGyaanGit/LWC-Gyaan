import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import CASE_NOTIFY from '@salesforce/messageChannel/CaseNotification__c';

export default class NotificationBell extends LightningElement {
    showBadge = false;
    caseCount = 0;
    notificationMessage = '';

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        subscribe(this.messageContext, CASE_NOTIFY, (message) => this.handleNotification(message));
    }

    handleNotification(message) {
        if (message?.type === 'NewCase') {
            this.caseCount += 1;
            this.notificationMessage = message.message;
            this.showBadge = true;
        }
    }
}