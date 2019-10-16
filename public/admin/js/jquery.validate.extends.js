$.validator.addMethod("maxFileSize", function (value, element) {
    if (this.optional(element) || ! element.files || ! element.files[0]) return true;
    else return element.files[0].size <= 1024 * 1024 * 4;
});

$.validator.addMethod('filesize', function(value, element, param) {
    return this.optional(element) || (element.files[0].size <= param)
}, 'File size must be less than 300 kb');

$.validator.addMethod("phoneStartingWith", function(phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, "");
    return this.optional(element) || phone_number.match(/^[965]\d{7,}$/);
}, 'Mobile number should start with 5, 6 or 9');

$.validator.addMethod('minStrict', function (value, el, param) {
    return value > param;
});

$.validator.addMethod('selectRequired', function (value, el, param) {
    return value !== param;
}, 'This field is required');

jQuery.validator.addMethod("allRequired", function(value, elem, name){
    return  $('input[name*="'+name+'"]').map(function(i,obj){return $(obj).val();}).get().every(function(v){ return v; });
});

$.validator.addMethod("valueNotEqualsAbout", function (value, elem, param) {
    // $("#short_en").val($('#short_en .summernote').code());
    if ($("#short_en").val() != "" && $("#short_en").val().replace(/(<([^>]+)>)/ig, "") != "") {
        // $('#short_en').val('');
        console.log($("#short_en").val().length + '111')
        return true;
    } else {
        console.log($("#short_en").val().length + " 2 ")
        return false;
    }
}, 'This field is required.');