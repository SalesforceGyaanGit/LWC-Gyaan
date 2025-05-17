import { LightningElement } from 'lwc';

export default class LifecycleHooksDemo1 extends LightningElement {
    constructor() {
        super();
        console.log('constructor: Component bana');
      }
    
      connectedCallback() {
        console.log('connectedCallback: DOM me lag gaya');
      }
    
      renderedCallback() {
        const heading = this.template.querySelector('.heading');
        heading.style.color = 'blue';
        console.log('renderedCallback: DOM access kiya');
      }
    
      errorCallback(error, stack) {
        console.log('errorCallback: Kuch fat gaya bhai', error);
      }
    
      disconnectedCallback() {
        console.log('disconnectedCallback: Hata diya gaya screen se');
      }
}