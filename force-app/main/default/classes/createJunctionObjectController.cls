public with sharing class createJunctionObjectController {
    @AuraEnabled
    public static void createJunctionObject(
        String junctionObejctName, String targetFieldApiName, String catalogFieldApiName,
        String targetObjectName, String catalogObjectName, String tagSettingId, String sessionId
    ){
        try {
            MetadataServiceHandler.createCustomObjects(
                junctionObejctName,targetFieldApiName,catalogFieldApiName,
                targetObjectName,catalogObjectName,tagSettingId,sessionId
            );
 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}