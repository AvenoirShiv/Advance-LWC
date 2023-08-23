import { LightningElement, track, wire } from 'lwc';
import getSObjects from '@salesforce/apex/createCustomFieldController.getSObjects';
import createFields from '@salesforce/apex/createCustomFieldController.createFields';
import { getToRenderFieldType, getFieldValue, getFieldTypeOption, getCheckBoxDefalutOptions, getFormatedAPIName, hasSpecialCharacters } from './customFieldHelper.js'
export default class CreateCustomFields extends LightningElement {
    isObjectSelected = false;
    SObjectList = [];
    selectObjects = '';
    errorFound = false;
    errorMessage = '';
    isRequired = true;
    @track referenceObjectList;
    @track allData = [
        {
            field: getFieldValue(),
            componentType: getToRenderFieldType(),
            isErrorFound : false,
        }
    ]
    @track fieldTypeOptions = getFieldTypeOption();
    checkBoxDefaulOption = getCheckBoxDefalutOptions();
    allFields =[];
    scaleMaxValue;
    @wire(getSObjects) getSObjectsData({ data, error }) {
        if (data) {
            this.SObjectList = data;
            console.log('SObjectList', JSON.stringify(this.SObjectList));
        }
        else if (error) {

        }
    }

    addField() {
        let fieldtemp = getFieldValue();
        fieldtemp.id = this.allData[this.allData.length-1].field.id + 1;
        this.allData = [...this.allData, {
            field: fieldtemp,
            componentType: getToRenderFieldType()
        }];
    }

    createFields() {
        console.log('data : ', JSON.stringify(this.allData));
        for(let i=0; i<this.allData.length; i++){
            this.allFields.push(this.allData[i].field);
        }
        createFields({inputData: JSON.stringify(this.allFields), objectName : this.selectObjects})
        .then (result => {
            console.log('result : ');
        })
        .catch (error => {
            console.log('error : ' + JSON.stringify(error));
        })
    }

    handelDelete(event) {
        console('Index : ');
    }

    handleLabelChange(event) {
        this.errorFound = false;
        const index = event.target.dataset.index;
        //console.log(hasSpecialCharacters(event.target.value));
        this.allData[index].isErrorFound = false;
        if(hasSpecialCharacters(event.target.value)){
            this.errorFound = true;
            this.allData[index].isErrorFound = true;
            this.errorMessage = 'You cannot you any special characters expect spaces and number';
        }
        else{
            this.allData[index].field.label = event.target.value;
            this.allData[index].field.apiName = getFormatedAPIName(event.target.value);
        } 
    }

    handleAPINameChange(event) {
        this.errorFound = false;
        const index = event.target.dataset.index;
        //console.log(hasSpecialCharacters(event.target.value));
        if(hasSpecialCharacters(event.target.value)){
            this.errorFound = true;
            this.errorMessage = 'You cannot you any special characters except spaces and number';
        }
        else{
            this.allData[index].field.apiName = getFormatedAPIName(event.target.value);
        }
    }

    handleTypeChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.type = event.target.value;
        this.handleFieldTypeChange(event.target.value, index);
        //this.selectedfieldsType = event.target.value;
    }

    handleTextLengthChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.textLength = event.target.value;
        this.scaleMaxValue = 18 - event.target.value;
    }
    handlevisibleLinesChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.visibleLines = event.target.value;
    }
    handleScaleChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.scale = event.target.value;  
    }
    handleTextAreaTypeChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.textAreaType = event.target.value;
    }
    handleCheckBoxDefaultChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.defaultvalue = event.target.value;
    }
    handleRelationshipLabelChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.relationshipLabel = event.target.value;
    }

    handleRelationshipNameChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.relationshipName = event.target.value;
    }

    handleReferenceToChange(event) {
        const index = event.target.dataset.index;
        this.allData[index].field.referenceTo = event.target.value;
    }

    handleSelectObjectChange(evert) {
        this.selectObjects = evert.target.value;
        if (this.selectObjects !== '') {
            this.isObjectSelected = true;
        }
        console.log(this.selectObjects);
        this.referenceObjectList = this.SObjectList.filter(obj => obj.value !== this.selectObjects);
        console.log(JSON.stringify(this.referenceObjectList));
    }

    handleFieldTypeChange(value, index) {
        this.allData[index].componentType = getToRenderFieldType();
        if (value === "text") {
            this.allData[index].componentType.isTextComponent = true;
        }
        else if (value === "number") {
            this.allData[index].componentType.isNumberComponent = true;
        }
        else if (value === "checkbox") {
            this.allData[index].componentType.isCheckboxComponent = true;
        }
        else if (value === "date") {
            this.allData[index].componentType.isDateComponent = true;
        }
        else if (value === "lookup") {
            this.allData[index].componentType.isLookupComponent = true;
        }
        else if (value === "longTextArea") {
            this.allData[index].componentType.isLongTextAreaComponent = true;
        }
        else if (value === "masterdetail") {
            this.allData[index].componentType.isMasterDetailComponent = true;
        }
        else if (value === "pickList") {
            this.allData[index].componentType.isPickListComponent = true;
        }
        console.log('data : ' + JSON.stringify(this.allData));
    }
}