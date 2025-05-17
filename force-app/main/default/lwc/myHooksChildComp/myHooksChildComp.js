import { LightningElement } from 'lwc';

export default class MyHooksChildComp extends LightningElement {
    constructor()
    {
        super();
        console.log(' My Hooks Child Coomponent constructor');
    }
    connectedCallback()
    {

    }
    renderedCallback()
    {
        console.log('I am in Child Component - Rendered Callback');
    }
    disconnectedCallback()
    {
        console.log('I am in disconnected callback');
    }
}