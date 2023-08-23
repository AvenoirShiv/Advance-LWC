trigger AccountTrigger on Account (after insert) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            AccountTriggerHandle.createContactRecord(trigger.new);
        }
    }
}