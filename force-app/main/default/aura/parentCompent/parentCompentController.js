({
	callChildMethod : function(component, event, helper) {
        console.log("Working in Parent");
        var childComp = component.find("childcomp");
        console.log(childComp);
        childComp.showMethod("Hello");
	},
    handleParentAction : function(component, event, helper) {
        var childComp = component.find("child");
        component.set("v.ValueInParent", childComp.get("v.valueForParent"));
    }
})