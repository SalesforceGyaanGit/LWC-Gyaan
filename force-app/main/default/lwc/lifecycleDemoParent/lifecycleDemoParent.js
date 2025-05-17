import { LightningElement } from 'lwc';

export default class LifecycleDemoParent extends LightningElement {
    showChild = false;
    errorMessage = '';

    toggleChild() {
        this.showChild = !this.showChild;    // this.showchild = TRUE
        this.errorMessage = '';
    }

    errorCallback(error, stack) {
        this.errorMessage = `💥 errorCallback (PARENT): ${error.message}`;
    }

    get toggleLabel() {
        return this.showChild ? '❌ Remove Child Component' : '✅ Add Child Component';
    }
}
