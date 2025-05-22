import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class NavigationAllExample extends LightningElement {
    // Example 1: Record Page (Account record)
    navigateToRecord() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0015i00000tKvyzAAC',  // Replace with real recordId
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }

    // Example 2: List View of Contact
    navigateToListView() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'list'
            },
            state: {
                filterName: 'All Contacts'  // or custom view API name
            }
        });
    }

    // Example 3: Website
    navigateToWebsite() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url: 'https://www.salesforcegyaan.com'
            }
        });
    }

    // Example 4: Custom Tab (App Page, Tab name = Salesforce_Gyaan)
    navigateToTabPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'MediHealth_Lightning_AppPage'  // Tab API Name from App Builder
            }
        });
    }
}