import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import AGENT_STATUS_CHANNEL from '@salesforce/messageChannel/AgentStatus__c'

export default class AgentControlPanel extends LightningElement {
    status = 'Available';

    statusOptions = [
        { label: 'Available', value: 'Available' },
        { label: 'Busy', value: 'Busy' },
        { label: 'Offline', value: 'Offline' }
    ];

    @wire(MessageContext)
    messageContext;

    handleChange(event) {
        this.status = event.detail.value;
        const payload = {
            agentId: '007',
            status: this.status
        };
        publish(this.messageContext, AGENT_STATUS_CHANNEL, payload);
    }
}