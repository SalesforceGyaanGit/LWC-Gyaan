import { LightningElement, track } from 'lwc';
import HideTemp from './HideTemplate.html';
import ShowTemp from './ShowTemplate.html';
export default class MyHooksComponent extends LightningElement {
    CompanyDetails = true;
    @track IsComponentRendered = true;
    err;
    stk;
    constructor()
    {
        super();
        console.log('Hello Salesforce Gyaan, I am in Constructor');
    }
    connectedCallback()
    {
        var IsConn = this.template;
        console.log('Component connected to DOM'+IsConn.isConnected);
    }
    render()
    {
        console.log('I am in Render()');
        return this.CompanyDetails ? ShowTemp : HideTemp;
    }
    renderedCallback()
    {
        if(this.IsComponentRendered ==  true)
        {
            console.log(' This component is rendered and I am in RenderedCallback');
            this.IsComponentRendered = true;
        }
    }
    disconnectedCallback()
    {
        console.log('I am in disconnected callback');
    }
    errorCallback(error,stack)
    {
        console.log(' I am in errorCallback method');
        this.err = error;
        this.stk = stack;
    }

}