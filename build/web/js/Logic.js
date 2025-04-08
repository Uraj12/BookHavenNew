/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function ajaxCall(method, url, data, desc, isHtml, isFile) {
    var xhttp = new XMLHttpRequest();
    xhttp.onload = function () {
        if (isHtml) {
            document.getElementById(desc).innerHTML = this.responseText;
        } else {
            document.getElementById(desc).value = this.responseText;
        }
    };
    xhttp.open(method, url, false);
    if (!isFile) {
        xhttp.setRequestHeader('content-type', 'application/x-www-form-urlencoded');
    }
    xhttp.send(data);
}

function refresh() {
    var path = window.location.pathname;
    refreshNav();
    var pathParts = path.split('/');
    var lastPart = pathParts[pathParts.length - 1];
    if (lastPart === 'Checkout.jsp') {
        refershCart();
    } else if (lastPart === 'wishlist.jsp') {
        refreshWL();
    }
}


function refreshIndex() {
    ajaxCall('GET', 'BookFragment.jsp', null, 'refresh-index', "html");
}
function refreshNav() {
    ajaxCall('GET', 'Navs.jsp', null, 'nav', "html");
}
function refershCart() {
    ajaxCall('GET', 'CartFragment.jsp', null, 'refresh-cart', "html");
}
function refreshWL() {
    ajaxCall('GET', 'WishlistFragment.jsp', null, 'refresh-wl', "html");
}
function refreshCategory() {
    ajaxCall('GET', 'CategoryFragment.jsp', null, 'refresh-category', "html");
}



function BookLanding(id) {
    window.open("book-page.jsp?id=" + id);
}

function AddToCart(user_id, book_id) {
    ajaxCall('POST', 'Ecommerce.fin', 'process=AddToCart&userId=' + user_id + '&bookId=' + book_id, 'hiddenData', 'html');
    var status = document.getElementById("status").value;
    if (status > 0) {
        refresh();
        return 1;
    } else {
        alert("An error Ocurred");
        return 0;
    }

}
function quantityChanged(el, operation, id) {

    var closestParent = el.closest('.checkout-product');
    var inputElement = closestParent.querySelector('input[type="text"]');
    var inputValue = parseInt(inputElement.value);
    if (operation === 'add' && inputValue < 12) {
        inputValue++;
    } else if (operation === 'minus' && inputValue > 1) {
        inputValue--;
    }
    ajaxCall('POST', 'Ecommerce.fin', 'process=quantityChange&quantity=' + inputValue + '&cartId=' + id, 'hiddenData', 'html');
    let status = document.getElementById("status").value;
    if (status > 0) {
        return;
    } else {
        alert("An error Ocurred");
    }

}
function DeleteCartItem(user_id, book_id) {
    ajaxCall('POST', 'Ecommerce.fin', 'process=deleteCartItem&userId=' + user_id + '&bookId=' + book_id, 'hiddenData', 'html');
    let status = document.getElementById("status").value;
    if (status > 0) {
        refresh();
        return 1;
    } else {
        alert("An error Ocurred");
        return 0;
    }

}

function AddToWl(user_id, book_id) {
    ajaxCall('POST', 'Ecommerce.fin', 'process=AddToWl&userId=' + user_id + '&bookId=' + book_id, 'hiddenData', 'html');
    let status = document.getElementById("status").value;
   if (status > 0) {
        refresh();
        return 1;
    } else {
        alert("An error Ocurred");
        return 0;
    }

}
function DeleteWlItem(user_id, book_id) {
    ajaxCall('POST', 'Ecommerce.fin', 'process=deleteWlItem&userId=' + user_id + '&bookId=' + book_id, 'hiddenData', 'html');
    let status = document.getElementById("status").value;
    if (status > 0) {
        refresh();
        return 1;
    } else {
        alert("An error Ocurred");
        return 0;
    }

}

function Filter() {
    var category = document.getElementById('exampleFormControlSelect1').value;
    var year = document.getElementById('exampleFormControlSelect3').value;
    var author = document.getElementById('exampleFormControlSelect4').value;
    var price = document.getElementById('exampleFormControlSelect2').value;


    ajaxCall('POST', 'book.fin', 'process=Filter&category=' + category +
            '&year=' + year + '&author=' +
            author + '&price=' +
            price, 'category-book', 'html');

}
function BookType() {

}

function UpdateCartItem(user_id, book_id) {
    let closestIcon = event.target.closest("i");

    if (closestIcon.classList.contains('ri-shopping-cart-2-fill')) {
        if (DeleteCartItem(user_id, book_id) === 1) {
            closestIcon.classList.remove('ri-shopping-cart-2-fill');
            closestIcon.classList.add('ri-shopping-cart-2-line');
        }
    } else if (closestIcon.classList.contains('ri-shopping-cart-2-line')) {
        if (AddToCart(user_id, book_id) === 1) {
            closestIcon.classList.remove('ri-shopping-cart-2-line');
            closestIcon.classList.add('ri-shopping-cart-2-fill');
        }
    }
}

function UpdateWlItem(user_id, book_id) {
    let closestIcon = event.target.closest("i");

    if (closestIcon.classList.contains('ri-heart-fill')) {
        if (DeleteWlItem(user_id, book_id) === 1) {
            closestIcon.classList.remove('ri-heart-fill');
            closestIcon.classList.add('ri-heart-line');
        }
    } else if (closestIcon.classList.contains('ri-heart-line')) {
        if (AddToWl(user_id, book_id) === 1) {
            closestIcon.classList.remove('ri-heart-line');
            closestIcon.classList.add('ri-heart-fill');
        }
    }
}
function updateSingleCart(user_id, book_id) {
    let closestIcon = event.target.closest("a");

    if (closestIcon.innerHTML === "In Cart") {
        if (DeleteCartItem(user_id, book_id) === 1) {
            closestIcon.innerHTML = "Add to Cart";
        }
    } else if (closestIcon.innerHTML === "Add to Cart") {
        if (AddToCart(user_id, book_id) === 1) {
            closestIcon.innerHTML = "In Cart";
        }
    }
}

function updateSingleWl(user_id, book_id) {
    let closestIcon = event.target.closest("a");
    let actionText = closestIcon.querySelector('span').innerText;
    if (closestIcon.innerHTML === "In Wishlist") {
        if (DeleteWlItem(user_id, book_id) === 1) {
            closestIcon.querySelector('span').innerText = "Add to Wishlist";
        }
    } else if (closestIcon.innerHTML === "Add to Wishlist") {
        if (AddToWl(user_id, book_id) === 1) {
            closestIcon.querySelector('span').innerText = "In Wishlist";
        }
    }
}

function searchBooks() {
    let searchwords = document.getElementById("search").value;
    ajaxCall('POST', 'book.fin', 'process=search&searchwords=' + searchwords, 'category-book', 'html');
    
}

    function IssueBook(userId, bookId) {
        var data = "userId=" + encodeURIComponent(userId) + "&bookId=" + encodeURIComponent(bookId) + "&process=IssueBook";

        alert('Issuing book with ID ' + bookId + ' for user ID ' + userId);

        ajaxCall('POST', 'Ecommerce.fin', data, 'quantity', 'isHTML');

        var status = document.getElementById('status').value;
        alert(status);
        if (status >0) {
            alert("book issue request sent  successfully");
           document.getElementById('issue').innerText = 'Request Sent Successfully'; // Update button text
        } else if (status == -9) {

            alert("already exist in reuest or alreday issue");
        }else{
            alert("no stok available");
        }
    }

function RenewalBook(userId, bookId) {
    var data = "userId=" + encodeURIComponent(userId) + "&bookId=" + encodeURIComponent(bookId) + "&process=RenewalBook";

    alert('renew book with ID ' + bookId + ' for user ID ' + userId);

    ajaxCall('POST', 'Ecommerce.fin', data, 'renewcount','isHTML');
        var status = document.getElementById('status').value;
        alert('Book issued renew! Status: ' + status);
        if(status>0){
            alert("renew request successfully");
            
        }else if(status=""){
            alert("you do not renew for than  times");
        }else{
            alert("issue first");
        }
        document.getElementById("status").innerHTML = status; // Update the status in your HTML

  
}

function ReturnBook(userId, bookId) {
    var data = "userId=" + encodeURIComponent(userId) + "&bookId=" + encodeURIComponent(bookId) + "&process=bookreturn";

    alert('return book with ID ' + bookId + ' for user ID ' + userId);

    ajaxCall('POST', 'Ecommerce.fin', data, 'bookreturn', 'isHTML');

    var status = document.getElementById('status').value;
    alert(status);
    if (status == 1) {
        alert("book return  successfully");
       document.getElementById('issue').innerText = 'Request Sent Successfully'; // Update button text
    } else if (status == 0) {

        alert("please issue the book first");
    }
}

 function toggleEditable() {
    var name = document.getElementById('name');
    var email = document.getElementById('email');
    var phno = document.getElementById('phno');
    var address1 = document.getElementById('address1');
    var address2 = document.getElementById('address2');
    var editButton = document.getElementById('editButton');

    name.contentEditable = !name.isContentEditable;
    email.contentEditable = !email.isContentEditable;
    phno.contentEditable = !phno.isContentEditable;
    address1.contentEditable = !address1.isContentEditable;
    address2.contentEditable = !address2.isContentEditable;

    // Toggle button text and function
    if (editButton.innerHTML.trim() === 'Edit') {
        editButton.innerHTML = 'Save';
        editButton.onclick = saveChanges;
    } else {
        editButton.innerHTML = 'Edit';
        editButton.onclick = toggleEditable;
    }
}

function saveChanges() {
    var updatedName = document.getElementById('name').value;
    var updatedEmail = document.getElementById('email').value;
    var updatedPhno = document.getElementById('phno').value;
    var updatedAddress1 = document.getElementsByName('address1')[0].value; // Updated to access textarea value
    var updatedAddress2 = document.getElementsByName('address2')[0].value; // Updated to access textarea value

    // AJAX call to update the profile with the updated values
    ajaxCall('POST', 'Ecommerce.fin', 'updatedName=' + updatedName + '&updatedEmail=' + updatedEmail + '&updatedPhno=' + updatedPhno + '&updatedAddress1=' + updatedAddress1 + '&updatedAddress2=' + updatedAddress2 + '&process=updateUserProfile', 'profile', true);
    
    var status = document.getElementById('status').value;
    alert(status);
    if (status > 0) {
        alert("Update successful");
    } else {
        alert("Problem occurred");
    }
}

function logout() {
    ajaxCall('POST', 'Ecommerce.fin', 'process=logout', '', 'isHTML');
}

function sendChatMessage(message) {
    // Prepare data to send to the servlet
    var data = "message=" + encodeURIComponent(message);
    
    // Call the servlet using AJAX
    ajaxCall('POST', 'ChatbotServlet', data, 'chat-response', false, false);
}

