  import { LightningElement } from 'lwc';

export default class LifecycleDemoChild extends LightningElement {
    status = [];
    timeNow = '';
    headingColor = 'black';
    renderedOnce = false;
    errorMsg = '';
    showFailingChild = false;

    constructor() {
        super();
        this.status.push('🛠 constructor() called');
    }

    connectedCallback() {
        const now = new Date().toLocaleTimeString();
        this.timeNow = now;
        this.status.push('🔗 connectedCallback(): Time initialized at ' + now);
    }

    renderedCallback() {
        if (!this.renderedOnce) {
            const heading = this.template.querySelector('.heading');
            if (heading) {
                heading.style.color = 'red';
                this.headingColor = 'red';
            }
            this.status.push('🎨 renderedCallback(): Heading colored red');
            this.renderedOnce = true;
        }
    }

    disconnectedCallback() {
        alert('🚪 disconnectedCallback(): Component removed');
    }

    errorCallback(error, stack) {
        this.errorMsg = `💥 errorCallback(): ${error.message}`;
        this.status.push(this.errorMsg);
    }

    throwError() {
        this.showFailingChild = true;
    }
}
