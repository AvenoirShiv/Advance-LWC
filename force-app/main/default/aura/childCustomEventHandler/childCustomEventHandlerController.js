({
	fireComponentEvent : function(component, event, helper) {
		var customEvn = component.getEvent("custEvent");
        var message = component.get("v.message");
        message =$A.util.isEmpty(message)?"No message is passed" : message;
        customEvn.setParams({
            "message":message
        });
        customEvn.fire();
	}
})