$(function(){

                $.validator.setDefaults({
                    errorClass: 'help-block',
                    highlight: function(element) {
                        $(element)
                        .closest('.form-group')
                        .addClass('has-error');
                    },
                    unhighlight: function(element) {
                        $(element)
                        .closest('.form-group')
                        .removeClass('has-error');
                    },
                });
                
                $.validator.addMethod('daterange', function(value, element, arg) {
                    if (this.optional(element) && !value) {
                        return true;
                    }
                    var startDate = Date.parse(arg[0]),
                        endDate = Date.parse(arg[1]),
                        enteredDate = Date.parse(value);
                    if (isNaN(enteredDate)) {
                        return false;
                    }
                    return ( (isNaN(startDate) || (startDate <= enteredDate)) &&
                             (isNaN(endDate) || (enteredDate <= endDate)));
                    }, $.validator.format("Your age should be between 18-23"));
  
                $("#sturegform").validate({
                    rules: {
                        htno: {
                            required: true,
                            minlength: 10,
                            remote:  '../php/reg/htnoreg.jsp' 
                        },
                        fname: {
                            required: true
                        },
                        lname: {
                            required: true
                        },
                        dob: {
                            required: true,
                            daterange: ['01/01/1991','12/31/1997']
                        },
                        gender: {
                            required: true
                        },
                        branch: {
                            required: true
                        },
                        year: {
                            required: true
                        },
                        phone: {
                            required: true,
                            digits: true,
                            remote:  '../php/reg/phonereg.jsp'
                        },
                        address: {
                            required: true
                        },
                        emailid: {
                            required: true,
                            email: true,
                            remote:  '../php/reg/emailidreg.jsp'
                        },
                        password: {
                            required: true,
                            minlength: 4,
                            maxlength: 12
                            
                        },
                        rtpassword: {
                            required: true,
                            equalTo: '#password'
                        }
                    },
                    messages: {
                        htno: {
                            required: "HallTicket No is mandatory",
                            minlength: "Invalid HallTicket No",
                            remote: $.validator.format("{0} is already Registered. Please try to <a href=../jsp/studentloginform.jsp>Login<a/>.")
                        },
                        fname: {
                            required: "This field should not be empty"
                        },
                        lname: {
                            required: "This field should not be empty"
                        },
                        dob: {
                            required: "Date of Birth is mandatory"
                        },
                        gender: {
                            required: "Please select your Gender"
                        },
                        branch: {
                            required: "Please select Department"
                        },
                        year: {
                            required: "Please select Year of Study"
                        },
                        phone: {
                            required: "Please enter your Mobile No",
                            digits: "Invalid Mobile No",
                            remote: $.validator.format("{0} is already Registered. Please provide a unique Mobile No.")
                        },
                        address: {
                            required: "This field should not be empty"
                        },
                        emailid: {
                            required: "Please enter your Email ID",
                            email: "Invalid Email ID",
                            remote: $.validator.format("{0} is already Registered. Please provide a unique Email ID.")
                        },
                        password: {
                            required: "Please enter a Password",
                            minlength: "Password must be greater than 4 characters",
                            maxlength: "Password must be less than 13 characters"
                        },
                        rtpassword: {
                            required: "Please confirm Password",
                        }
                    }
                });
                
                $("#stuloginform").validate({
                    rules: {
                        htno: {
                            required: true,
                            minlength: 10,
                            remote:  '../php/login/htnoreglog.jsp' 
                        },
                        password: {
                            required: true   
                        }
                    },
                    messages: {
                        htno: {
                            required: "HallTicket No is mandatory",
                            minlength: "Invalid HallTicket No",
                            remote: $.validator.format("{0} is not Registered. Please <a href=../jsp/studentregform.jsp>Register<a/>.")
                        },
                        password: {
                            required: "Please enter a Password"
                        }
                    }
                });
                
        
            $("#facloginform").validate({
                    rules: {
                        htno: {
                            required: true
                        },
                        password: {
                            required: true   
                        }
                    },
                    messages: {
                        htno: {
                            required: "Username is mandatory"
                        },
                        password: {
                            required: "Please enter a Password"
                        }
                    }
                });
            });
            
                