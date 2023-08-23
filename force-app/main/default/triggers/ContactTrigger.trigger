trigger ContactTrigger on Contact (before insert){
    if (trigger.isBefore) {
        if (trigger.isInsert) {
            ContactTriggerHandler.handleBeforeInsert(trigger.new);
        }
    }
}