function Registration() {
    // Validate form fields
    var result = validateForm();

    if (result) {
        // Get form field values
        var name = document.getElementById('name').value;
        var email = document.getElementById('email').value;
        var contact = document.getElementById('contact').value;
        var password = document.getElementById('pass').value;
        var confirmPassword = document.getElementById('re_pass').value;

        // Construct data as a query string
        var requestData = 'name=' + encodeURIComponent(name) +
                '&email=' + encodeURIComponent(email) +
    '&contact=' + encodeURIComponent(contact) +
    '&password=' + encodeURIComponent(password) +
    '&re_pass=' + encodeURIComponent(confirmPassword) +
    '&process=registration';

        // Make AJAX call to the server
        ajaxCall('POST', 'session.fin', requestData, 'ajax');
        alert("ajaxall ho raha hai ");

        // Set a timeout to read the AJAX response after a delay
        setTimeout(function () {
            var status = parseInt(document.getElementById('ajax').value);
            alert("status"+status);

            // Check the status received from the server
            if (!isNaN(status)) {
                if (status > 0) {
                    // Registration successful, redirect to OTP verification page
                    Swal.fire({
                        icon: 'success',
                        title: 'check your email!',
                        text: 'otp is sent in your email address '
                    }).then(function() {
                        window.location.href = "RegistrationOtpValidate.jsp";
                    });
                } else if (status === -1) {
                    // User with the given email or contact already exists
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'User with the given email or contact already exists. Please use a different email or contact.'
                    });
                } else if (status === -2) {
                    // Failed to send verification email
                    Swal.fire({
                        icon: 'error',
                        title: 'Failed to send verification email',
                        text: 'Please ensure your email is valid.'
                    });
                } else {
                    // Registration failed for other reasons
                    Swal.fire({
                        icon: 'error',
                        title: 'Registration failed',
                        text: 'Please try again.'
                    });
                }
            } else {
                // Invalid status received
                Swal.fire({
                    icon: 'error',
                    title: 'Invalid status received',
                    text: 'Please try again later.'
                });
            }
        }, 500); // Delay to wait for AJAX response
    }

    return false; // Prevent default form submission
}



function validateForm() {
    var name = document.getElementById('name');
    var email = document.getElementById('email');
    var contact = document.getElementById('contact');
    var nickname = document.getElementById('nickname');
    var password = document.getElementById('pass');
    var confirmPassword = document.getElementById('re_pass');

    // Empty validation for Name
    if (name.value.trim() === '') {
        alert('Please fill in the name field');
        addErrorEffect(name);
        return false;
    } else {
        removeErrorEffect(name);
    }

    // Empty validation for Email
    if (email.value.trim() === '') {
        alert('Please fill in the email field');
        addErrorEffect(email);
        return false;
    } else {
        removeErrorEffect(email);
    }

    // Additional validation for Email (e.g., regex)
    var emailRegex = /^[a-zA-Z0-9._-]+@gmail\.com$/;
    if (!emailRegex.test(email.value)) {
        alert('Please enter a valid email address');
        addErrorEffect(email);
        return false;
    } else {
        removeErrorEffect(email);
    }

    // Empty validation for Contact
    var contactRegex = /^(\+91)?[6-9]\d{9}$/;
    if (contact.value.trim() === '') {
        alert('Please fill in the contact number');
        addErrorEffect(contact);
        return false;
    } else if (contact.value.length !== 10 || !contactRegex.test(contact.value)) {
        alert('Please enter a valid 10-digit contact number starting with 6, 7, 8, or 9');
        addErrorEffect(contact);
        return false;
    } else {
        removeErrorEffect(contact);
    }

   
   

    // Empty validation for Password
    if (password.value.trim() === '') {
        alert('Please fill in the password field');
        addErrorEffect(password);
        return false;
    } else {
        removeErrorEffect(password);
    }

    // Empty validation for Confirm Password
    if (confirmPassword.value.trim() === '') {
        alert('Please fill in the confirm password field');
        addErrorEffect(confirmPassword);
        return false;
    } else {
        removeErrorEffect(confirmPassword);
    }

    if (password.value !== confirmPassword.value) {
        alert('Password and Confirm Password do not match');
        addErrorEffect(password);
        addErrorEffect(confirmPassword);
        return false;
    } else {
        removeErrorEffect(password);
        removeErrorEffect(confirmPassword);
    }

    // Additional validations, if needed, can be added here

    return true;
}



function addErrorEffect(element) {
    // Add error class
    element.classList.add('error');
}

function removeErrorEffect(element) {
    // Remove error class
    element.classList.remove('error');
}

// Adding event listeners to remove error on input change
var formElements = document.querySelectorAll('.register-form input');
formElements.forEach(function (element) {
    element.addEventListener('input', function () {
        removeErrorEffect(element);
    });
});
//login
function login() {
    var result = validate_empty('email', 'email') &&
            validate_empty('password', 'Password');

    var email = document.getElementById('email').value;
    alert(email);
    var password = document.getElementById('password').value;
    var requestData = 'email=' + encodeURIComponent(email) +
    '&password=' + encodeURIComponent(password) +
    '&process=login';
    if (result) {
        ajaxCall('POST', 'session.fin', requestData, 'ajax');
    alert("ajaxall");
        // read hidden value
        var status = document.getElementById('ajax').value;
       
        if (status > 0) {
            window.location.href="index.jsp";
        } else {
            alert(status);
        }
    }
    
    return false;
    }

function validate_empty(elementId, elementName) {
    var inputElement = document.getElementById(elementId);
    var value = inputElement.value.trim();

    // Check if the field is empty
    if (value === '') {
        // Mark the field as empty (if not already marked)
        if (!inputElement.classList.contains("invalid-field")) {
            inputElement.classList.add("invalid-field");
             addErrorEffect(inputElement);
        }

        // Create and append a tooltip if it doesn't exist
        var tooltip = createTooltip(elementId, elementName + " is required and cannot be empty!");
        inputElement.parentNode.appendChild(tooltip);

        return false;
    } else {
        // If the field is not empty, remove any existing tooltip and reset styles
        removeTooltip(elementId);
        inputElement.classList.remove("invalid-field");

        return true;
    }
}


function createTooltip(elementId, message) {
    var tooltip = document.createElement("span");
    tooltip.id = elementId + "-tooltip";
    tooltip.className = "tooltiptext";
    tooltip.textContent = message;

    // Position the tooltip near the input field (customize styles as needed)
    var rect = document.getElementById(elementId).getBoundingClientRect();
    tooltip.style.top = rect.bottom + "px";
    tooltip.style.left = rect.left + "px";

    // Add a class to the tooltip for red color
    tooltip.classList.add("red-text");

    return tooltip;
}

function removeTooltip(elementId) {
    var existingTooltip = document.getElementById(elementId + "-tooltip");
    if (existingTooltip) {
        existingTooltip.parentNode.removeChild(existingTooltip);
    }
}

function addErrorEffect(element) {
    element.classList.add('error'); // Assuming you have a CSS class for the error effect

    function removeError() {
        // Check if the input is now valid before removing the error class
        if (element.value.trim() !== '' && element.validity.valid) {
            element.classList.remove('error');
        }
         element.addEventListener('focus', removeError);
    }

    // Remove the error effect when shifting to the next field (focus event)
   
}

function profile() {
        window.location.href = 'profile.jsp';
    }
function ajaxCall(method, url, data, destination, isHtml) {
    var xhttp = new XMLHttpRequest();
    // event
    xhttp.onload = function () {
        if (isHtml) {
            document.getElementById(destination).innerHTML = this.responseText;
        } else {
            document.getElementById(destination).value = this.responseText;
        }
    };

    xhttp.open(method, url, false);
    xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');

    xhttp.send(data);
}