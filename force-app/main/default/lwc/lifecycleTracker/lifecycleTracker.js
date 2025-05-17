import { LightningElement } from 'lwc';

export default class LifecycleTracker extends LightningElement {
    logs = [];
    renderedOnce = false;
    showErrorChild = false;
    errorText = '';

    constructor() {
        super();
        this.logs.push('🛠 constructor() fired');
    }

    connectedCallback() {
        this.logs.push('🔗 connectedCallback() fired');
    }

    renderedCallback() {
        if (!this.renderedOnce) {
            const h2 = this.template.querySelector('h2');
            if (h2) h2.style.color = 'green';
            this.logs.push('🎨 renderedCallback() fired – Heading styled green');
            this.renderedOnce = true;
        }
    }

    errorCallback(error, stack) {
        this.logs.push(`💥 errorCallback() caught: ${error.message}`);
        this.errorText = error.message;
    }

    disconnectedCallback() {
        alert('🚪 disconnectedCallback() fired – Component removed');
    }

    triggerError() {
        this.showErrorChild = true;
    }
}
