import { LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
export default class ToastNotificationComponent extends LightningElement {
    _title = "Sample Title";
  message = "Sample Message";
  variant = "error";
  variantOptions = [
    { label: "error", value: "error" },
    { label: "warning", value: "warning" },
    { label: "success", value: "success" },
    { label: "info", value: "info" },
  ];

  titleChange(event) {
    this._title = event.target.value;
    console.log('Title == ',this._title);
  }

  messageChange(event) {
    this.message = event.target.value;
    console.log('Message == ',this.message);
  }

  variantChange(event) {
    this.variant = event.target.value;
    console.log('variant == ',this.variant);
  }

  showNotification() {
    const evt = new ShowToastEvent({
      title: this._title,
      message: this.message,
      variant: this.variant,
    });
    this.dispatchEvent(evt);
  }
}