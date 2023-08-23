const getToRenderFieldType = () => {
    return {
        "isTextComponent" : false,
        "isNumberComponent" : false,
        "isCheckboxComponent" : false,
        "isDateComponent" : false,
        "isLookupComponent" : false,
        "isLongTextAreaComponent" : false,
        "isMasterDetailComponent" : false,
        "isPickListComponent" : false,
    }   
}

const getFieldValue = () => {
    return{
        "id":0,
        "label":"",
        "apiName":"",
        "type":"",
        "textLength":"",
        "defaultvalue":"",
        "relationshipLabel" : "",
        "relationshipName" : "",
        "referenceTo" : "",
        "visibleLines" : "",
        "scale" : 0,
    }
}

const getFieldTypeOption = () => {
    return [
        { label: 'None', value: '' },
        { label: 'Text', value: 'text' },
        { label: 'Number', value: 'number' },
        { label: 'Checkbox', value: 'checkbox' },
        { label: 'Date', value: 'date' },
        { label: 'Lookup', value: 'lookup' },
        { label: 'Long Text Area', value: 'longTextArea' },
        { label: 'Master Detail', value: 'masterdetail' },
      //  { label: 'PickList', value: 'pickList' },
        // Add more field type options as needed
    ];
}

const getCheckBoxDefalutOptions = () => {
    return [
        { label: 'None', value: '' },
        { label: 'True', value: 'true' },
        { label: 'False', value: 'false' },
    ]
}

const getFormatedAPIName = (inputString) => {
    //console.log(inputString.length);
    if(inputString !== ''){
        inputString = inputString.trim();
        let modifiedString = inputString.replace(/\s+/g, "_");
        // if(modifiedString.endsWith('_')){
        //     modifiedString = modifiedString.replace("_","");
        // }
        if(!modifiedString.endsWith("__c")){
            modifiedString = modifiedString + "__c";
        }
        return modifiedString; 
    }
    else {
        return '';
    }
    
}

const hasSpecialCharacters = (inputString) => {
    // Regular expression to match special characters
    var specialCharsRegex = /[^A-Za-z0-9\s]/;
    
    // Check if the input string contains any special characters
    return specialCharsRegex.test(inputString);
}

export {
    getToRenderFieldType,
    getFieldValue, 
    getFieldTypeOption,
    getCheckBoxDefalutOptions,
    getFormatedAPIName,
    hasSpecialCharacters
};