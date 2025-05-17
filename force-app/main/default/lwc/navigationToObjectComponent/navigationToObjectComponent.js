import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class NavigationToObjectComponent extends NavigationMixin(LightningElement) {
    navigateToNewHospitalPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Hospital__c',
                actionName: 'new'
            },
        });
    }
}