({
    getMessage : function(component, event) {
        //get method paramaters
        var params = event.getParam('arguments');
        if (params) {
            var param1 = params.GreetingParam;
            var param2 = params.PersonNameParam;
            alert(param1 + " " + param2);
        }
    }
})