import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ToastNotificationRefreshed extends LightningElement {
    showSubmitToast(){
        console.log('showSubmitToast method invoked');

        const SubmitEvent = new ShowToastEvent({
            title: 'SUCCESS: ',
            variant: 'success',
            mode: 'dismissable',            
            message:
                'Congratulations, your form is submitted successfully, please find the email in your inbox.'
            });
        this.dispatchEvent(SubmitEvent);
    }
    showWarningToast(){
        const SubmitEvent = new ShowToastEvent({
            title: 'WARNING: ',
            variant: 'warning',
            mode: 'dismissable',            
            message:
                'You are not supposed to click on this button'
            });
        this.dispatchEvent(SubmitEvent);
    }
    showErrToast(){
        const SubmitEvent = new ShowToastEvent({
            title: 'ERROR ',
            variant: 'Error',
            mode: 'dismissable',            
            message:
                'Error Generated at backend, please try again '
            });
        this.dispatchEvent(SubmitEvent);
    }

    showInfoToast(){
        const SubmitEvent = new ShowToastEvent({
            title: 'INFORMATION ',
            variant: 'Info',
            mode: 'dismissable',            
            message:
                'This button is clickable only for Males'
            });
        this.dispatchEvent(SubmitEvent);
    }

}