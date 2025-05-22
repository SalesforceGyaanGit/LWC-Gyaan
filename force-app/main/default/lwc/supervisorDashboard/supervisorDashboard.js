import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import AGENT_STATUS_CHANNEL from '@salesforce/messageChannel/AgentStatus__c';
export default class SupervisorDashboard extends LightningElement {
    agentStatus = 'Waiting for status update...';

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        subscribe(this.messageContext, AGENT_STATUS_CHANNEL, (message) => {
            this.agentStatus = `Agent ${message.agentId} is now ${message.status}`;
        });
    }
}