import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class RefreshedNavigationComponent extends NavigationMixin(LightningElement) {
    handleClick(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list',
            },
            state:{
                filterName: 'MyAccounts'
            }
        });
    }
    handleSinglePatientRecord(){
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: 'a025i00000hHfBFAA0',
                objectApiName: 'Patient__c',
                actionName: 'view',
            }
        });
    }
    linkToWesbite(){
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url:'https://salesforcegyaan.com/'
            }
        });
    }
}