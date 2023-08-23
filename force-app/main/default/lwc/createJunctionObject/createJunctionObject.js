import { api, LightningElement } from 'lwc';
import createJunctionObject from '@salesforce/apex/createJunctionObjectController.createJunctionObject';
import {getcustomFields, getCustomObjectJson} from './JsonData.js';

export default class CreateJunctionObject extends LightningElement {
    @api junctionObjectName = '';
    @api targetObjectName = '';
    @api catalogObjectName = '';
    @api tagSettingId = '';
    @api targetObjectAPIName = '';
    @api catalogObjectAPIName = '';
    @api sessionId;
    finalData = {
        "customObject":'',
        "customFields":[]
    }
    connectedCallback(){
        console.log("session id :" , this.sessionId);
        //this.handleSubmit();

    }
    targetObjectOptions = [
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' },
        { label: 'Opportunity', value: 'Opportunity' }
    ];

    catalogObjectOptions = [
        { label: 'Account', value: 'Account' },
        { label: 'Contact', value: 'Contact' },
        { label: 'Opportunity', value: 'Opportunity' }
    ];

    handleObjectNameChange(event) {
        this.junctionObjectName = event.target.value;
    }

    handleTargetObjectNameChange(event) {
        this.targetObjectName = event.target.value;
    }

    handleCatalogObjectNameChange(event) {
        this.catalogObjectName = event.target.value;
    }
    
    handleTagSettingIdChange(event) {
        this.tagSettingId = event.target.value;
    }

    handleTargetObjectAPINameChange(event) {
        this.targetObjectAPIName = event.target.value;
    }

    handleTargetObjectAPINameChange(event) {
        this.targetObjectAPIName = event.target.value;
    }

    handleCatalogObjectAPINameChange(event) {
        this.catalogObjectAPIName = event.target.value;
    }

    handleSubmit() {
        // Perform form submission logic here
        // console.log('Form submitted');
        // console.log('Object Name:', this.junctionObjectName);
        // console.log('Target Object Name:', this.targetObjectName);
        // console.log('Catalog Object Name:', this.catalogObjectName);
        // console.log('Tag Setting Id:', this.tagSettingId);
        // console.log('Target Object Name Api:', this.targetObjectAPIName);
        // console.log('Catalog Object Name Api:', this.catalogObjectAPIName);
        //console.log("data", getcustomFields());
        // let customObjectCong = getCustomObjectJson();
        // customObjectCong.fullName = 'Object__c';
        // customObjectCong.label = 'Object';
        // customObjectCong.pluralLabel = 'Objects';
        // customObjectCong.deploymentStatus = 'Deployed';
        // customObjectCong.sharingModel = 'ReadWrite';
        // let customField = getcustomFields();
        // customField.type_x = 'Text';
        // customField.label = 'Name';
        // //this.finalData.push({"customObjects" : customObjectCong, "customFields" : customField });
        // this.finalData.customObject = customObjectCong;
        // this.finalData.customFields.push(customField);
        //console.log('Data:', this.finalData);
        createJunctionObject({
            junctionObejctName: this.junctionObjectName,
            targetFieldApiName : this.targetObjectAPIName,
            catalogFieldApiName : this.catalogObjectAPIName,
            targetObjectName : this.targetObjectName,
            catalogObjectName : this.catalogObjectName,
            tagSettingId : this.tagSettingId,
            sessionId : this.sessionId
        })
        .then(data => {
            console.log("done");
        })
        .catch(error => {
            console.log("Error: " + JSON.stringify(error));
        })
    }
}