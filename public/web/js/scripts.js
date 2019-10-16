$(function () {
    var mainForm = $('#contactForm');
    if(mainForm.length > 0) {
        mainValidation();
    }
});
function mainValidation() {
    var mainForm = $('#contactForm');
    if(mainForm.length > 0){
        $validator = mainForm.validate({
            rules: {
                'email': {required: true,email: true},
                'full_name': {required: true},
                'subject':{required: true},
            }
        });
        if (!$validator.valid()) {
            $validator.focusInvalid();
            return false;
        }
        return true;
    }

}
function validations(){
    var x = document.forms["contactForm"]["full_name"].value;
    if (!x == "") {
        document.getElementById('errors').innerHTML="*Please enter a username*";
        return false;
    }
}
function myFunction() {
    var x, text;

    // Get the value of the input field with id="numb"
    x = document.getElementById("formGroupExampleInput").value;

    // If x is Not a Number or less than one or greater than 10
    if (isNaN(x) || x === "") {
        text = "Input not valid";
    } else {
        text = "Input OK";
    }
    document.getElementById("demo").innerHTML = text;
}

function NumbersOnly(evt) {
    var theEvent = evt || window.event
    var key = theEvent.keyCode || theEvent.which
    key = String.fromCharCode(key)
    var regex = /[0-9]|\+/;

    if (!regex.test(key)) {
        theEvent.returnValue = false
        if (theEvent.preventDefault) theEvent.preventDefault()
    }
}