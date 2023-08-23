public with sharing class MetadataServiceHandler {
    public static void createObjectAndFields(){
        MetadataService.MetadataPort metadataservice = new MetadataService.MetadataPort();
        metadataservice .SessionHeader = new MetadataService.SessionHeader_element();
        metadataservice .SessionHeader.sessionId = UserInfo.getSessionId();
        List<MetadataService.CustomObject> objectList = new List<MetadataService.CustomObject>();
        MetadataService.CustomObject customobject = new MetadataService.CustomObject();
        customobject.fullName = 'Shiv__c';
        customobject.label = 'Shiv';
        customobject.pluralLabel = 'Shivs';
        customObject.nameField = new MetadataService.CustomField();
        customobject.nameField.type_x = 'Text';
        customobject.nameField.label = 'Name';
        customobject.deploymentStatus = 'Deployed';
        customObject.sharingModel = 'ReadWrite';
        objectList.add(customobject);
        metadataservice.createMetadata(objectList);
        List<MetadataService.CustomField> fieldsList = new List<MetadataService.CustomField>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = 'Shiv__c.isStudent__c';
        customField.label = 'Shiv';
        customField.defaultvalue = 'false';
        customField.type_x = 'Checkbox';
        fieldsList.add(customField);
        metadataservice.createMetadata(fieldsList);
    }
    public static void createCustomObjects( 
        String junctionObejctName, String targetFieldApiName, String catalogFieldApiName,
        String targetObjectName, String catalogObjectName, String tagSettingId, String sessionId
    ){
        MetadataService.MetadataPort metadataservice = new MetadataService.MetadataPort();
            metadataservice.SessionHeader = new MetadataService.SessionHeader_element();
            metadataservice.SessionHeader.sessionId =sessionId;
            List<MetadataService.CustomObject> objectList = new List<MetadataService.CustomObject>();
            MetadataService.CustomObject customobject = new MetadataService.CustomObject();
            customobject.fullName = junctionObejctName + '__c';
            customobject.label = junctionObejctName;
            customobject.pluralLabel = junctionObejctName + 's';
            customObject.nameField = new MetadataService.CustomField();
            customobject.nameField.type_x = 'Text';
            customobject.nameField.label = 'Name';
            customobject.deploymentStatus = 'Deployed';
            customObject.sharingModel = 'ReadWrite';
            objectList.add(customobject);
            metadataservice.createMetadata(objectList);
            // MetadataServiceHandler.createCustomFields(
            //         junctionObejctName, targetFieldApiName,catalogFieldApiName,
            //         targetObjectName,catalogObjectName,tagSettingId
            //     );
            
    }
     public static void createCustomFields(
        String junctionObejctName,String targetFieldApiName,String catalogFieldApiName,
        String targetObjectName, String catalogObjectName, String tagSettingId
    )
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service .SessionHeader = new MetadataService.SessionHeader_element();
        service .SessionHeader.sessionId = UserInfo.getSessionId();
        List<MetadataService.CustomField> customFieldList = new List<MetadataService.CustomField>();
        MetadataService.CustomField targetCustomField = new MetadataService.CustomField();
        targetCustomField.fullName = junctionObejctName + '__c.' + targetFieldApiName + '__c';
        targetCustomField.label = targetFieldApiName;
        targetCustomField.type_x = 'Lookup';
        targetCustomField.relationshipLabel =  targetFieldApiName+'s';
        targetCustomField.relationshipName = targetFieldApiName+'s';
        targetCustomField.referenceTo = targetObjectName;
        customFieldList.add(targetCustomField);
        MetadataService.CustomField catlogCustomField = new MetadataService.CustomField();
        catlogCustomField.fullName = junctionObejctName + '__c.' + catalogFieldApiName + '__c';
        catlogCustomField.label = catalogFieldApiName;
        catlogCustomField.type_x = 'Lookup';
        catlogCustomField.relationshipLabel =  catalogFieldApiName+'s';
        catlogCustomField.relationshipName = catalogFieldApiName+'s';
        catlogCustomField.referenceTo = catalogObjectName;
        customFieldList.add(catlogCustomField);
        MetadataService.CustomField tagSettingCustomField = new MetadataService.CustomField();
        tagSettingCustomField.fullName =  junctionObejctName + '__c.' + tagSettingId + '__c';
        tagSettingCustomField.label = tagSettingId;
        tagSettingCustomField.length = 255;
        tagSettingCustomField.type_x = 'Text';
        customFieldList.add(tagSettingCustomField);
        List<MetadataService.SaveResult> results =
            service.createMetadata(
                new MetadataService.Metadata[] { targetCustomField,catlogCustomField, tagSettingCustomField}
            );
    }
    public static void grantFieldPermissions() {
        // Get the System Administrator profile Id
        Id sysAdminProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id;
        System.debug('sysAdminProfileId' + sysAdminProfileId);
        // Create a new FieldPermissions record
        FieldPermissions fieldPerm = new FieldPermissions();
        fieldPerm.ParentId = UserInfo.getProfileId();
        fieldPerm.SobjectType = 'AccountContactJunction__c';
        fieldPerm.Field = 'AccountContactJunction__c.TagSetting__c';
        fieldPerm.PermissionsRead = true;
        fieldPerm.PermissionsEdit = true;

        // Insert the FieldPermissions record
        insert fieldPerm;

        System.debug('Field permission granted successfully for ');
    }
        public static void updateFieldPermissions() {
            try {
                Profile profile = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
                PermissionSet per =[Select id from PermissionSet where ProfileId =:profile.id limit 1];
                FieldPermissions[] fieldPermissions = [SELECT Id, SObjectType, Field, PermissionsRead, PermissionsEdit
                                                     FROM FieldPermissions
                                                     WHERE ParentId = :per.Id
                                                     AND SObjectType = 'testJunction__c'
                                                     AND Field = 'testJunction__c.TagSetting__c'
                                                     LIMIT 1];
                    if(fieldPermissions == null){
                        FieldPermissions fieldPermissions1 = new FieldPermissions();
                        fieldPermissions1.ParentId =per.id;
                        fieldPermissions1.SobjectType = 'testJunction__c';
                        fieldPermissions1.Field = 'testJunction__c.TagSetting__c';
                        // Update the field-level security values
                        fieldPermissions1.PermissionsRead = true;
                        fieldPermissions1.PermissionsEdit = true;
                        insert fieldPermissions1;
                    }
                    else{
                        //fieldPermissions[0].ParentId = per.id;
                        //fieldPermissions[0].SobjectType = 'testJunction__c';
                        //fieldPermissions[0].Field = 'testJunction__c.TagSetting__c';
                    // Update the field-level security values
                    fieldPermissions[0].PermissionsRead = true;
                    fieldPermissions[0].PermissionsEdit = true;
                        update fieldPermissions; 
                    }
                   
                
                // Save the changes
                
                System.debug('Field-level security updated successfully.');
            } catch (Exception e) {
                System.debug('An error occurred while updating field-level security. Error message: ' + e.getMessage());
            }
        }

    public static void updateFieldPermissionsForAllProfile() {
        List<PermissionSet> permissionSets = new List<PermissionSet>();
        permissionSets = [SELECT id FROM PermissionSet WHERE ProfileId IN (SELECT id FROM Profile)];
        System.debug('permissionSet' + permissionSets); 
    }

    public static void createDifferentTypeField(List<fieldWrapper> fieldWrappers, String objectName) {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service = createService();
        List<MetadataService.Metadata> dataToInsert = new List<MetadataService.Metadata>();
        for (fieldWrapper currentField : fieldWrappers) {
            MetadataService.CustomField field = new MetadataService.CustomField();
            if (currentField.type == 'text') {
                field.fullName =  objectName + '.' + currentField.apiName;
                field.label = currentField.label ;
                field.length = Integer.valueOf(currentField.textLength);
                field.type_x = 'Text';
            }
            else if (currentField.type == 'number') {
                field.fullName =  objectName + '.' + currentField.apiName;
                field.label = currentField.label;
                field.precision = Integer.valueOf(currentField.textLength);
                field.scale = Integer.valueOf(currentField.scale);
                field.type_x = 'Number';
                field.unique = false;
            }
            else if (currentField.type == 'checkbox') {
                field.fullName =  objectName + '.' + currentField.apiName;
                field.label = currentField.label ;
                field.defaultvalue = currentField.defaultvalue;
                field.type_x = 'Checkbox';
            }
            else if (currentField.type == 'date') {
                field.fullName =  objectName + '.' + currentField.apiName;
                field.label = currentField.label ;
                field.type_x = 'Date';
            }
            else if (currentField.type == 'lookup') {
                field.fullName = objectName + '.' + currentField.apiName;
                field.label = currentField.label;
                field.type_x = 'Lookup';
                field.relationshipLabel = currentField.relationshipLabel;
                field.relationshipName = currentField.relationshipName;
                field.referenceTo = currentField.referenceTo;
            }
            else if (currentField.type == 'longTextArea') {
                field.fullName = objectName + '.' + currentField.apiName;
                field.label = currentField.label;
                field.type_x = 'LongTextArea';
                field.length = Integer.valueOf(currentField.textLength);
                field.visibleLines = Integer.valueOf(currentField.visibleLines);
            }
            else if (currentField.type == 'masterdetail') {
                field.fullName = objectName + '.' + currentField.apiName;
                field.label = currentField.label;
                field.type_x = 'MasterDetail';
                field.relationshipLabel = currentField.relationshipLabel;
                field.relationshipName = currentField.relationshipName;
                field.referenceTo = currentField.referenceTo;
            }
            else if (currentField.type == 'pickList') {
                
            }
            dataToInsert.add(field);
        }
        List<MetadataService.SaveResult> results = service.createMetadata(dataToInsert);
    }
    public static MetadataService.MetadataPort createService(){
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();
        service.SessionHeader = new MetadataService.SessionHeader_element();
        //service.SessionHeader.sessionId = UserInfo.getSessionId();
        service.SessionHeader.sessionId = Utils.getSessionIdFromVFPage(Page.SessionId);
        return service;
    }
}