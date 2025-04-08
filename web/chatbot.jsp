<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chat Bot</title>
    <style>
        #chatbot-icon {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #007FEF;
            color: white;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        #chatbot-window {
            position: fixed;
            bottom: 80px;
            right: 20px;
            width: 350px;
            max-height: 500px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.3);
            display: none;
            flex-direction: column;
            z-index: 1000;
        }

        #chatbot-header {
            background-color: #007FEF;
            color: white;
            padding: 10px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
        }

        #chatbot-content {
            padding: 15px;
            overflow-y: auto;
            flex: 1;
            max-height: 300px;
            height: auto;
        }

        #chatbot-footer {
            border-top: 1px solid #ddd;
            padding: 10px;
        }

        #chatbot-input {
            width: calc(100% - 20px);
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
            font-size: 14px;
        }

        .message {
            margin: 5px 0;
            padding: 10px;
            border-radius: 8px;
            max-width: 75%;
            display: inline-block;
            clear: both;
        }

        .user-message {
            background-color: #007FEF;
            color: white;
            float: right;
        }

        .bot-message {
            background-color: #f1f1f1;
            color: black;
            float: left;
        }

    </style>

    <script>
        // Function to handle sending messages via AJAX
        function sendMessage() {
            var userMessage = document.getElementById('chatbot-input').value;
            if (userMessage.trim() !== "") {
                var chatContent = document.getElementById('chatbot-content');
                
                // Append user message to the chat window on the right
                chatContent.innerHTML += "<div class='message user-message'><strong>You:</strong> " + userMessage + "</div>";

                // Clear the input field
                document.getElementById('chatbot-input').value = "";

                // Call the servlet using AJAX
                var xhttp = new XMLHttpRequest();
                xhttp.onload = function() {
                    var response = JSON.parse(this.responseText);
                    // Append bot response to the chat window on the left
                    chatContent.innerHTML += "<div class='message bot-message'><strong>Bot:</strong> " + response.response + "</div>";
                    chatContent.scrollTop = chatContent.scrollHeight; // Auto scroll to bottom
                };
                xhttp.open("POST", "chatbot", true); // Use your servlet URL here
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("message=" + encodeURIComponent(userMessage));
            }
        }

        // Toggle the chat window visibility
        document.addEventListener('DOMContentLoaded', function() {
            const chatbotIcon = document.getElementById('chatbot-icon');
            const chatWindow = document.getElementById('chatbot-window');

            chatbotIcon.addEventListener('click', function() {
                if (chatWindow.style.display === 'none' || chatWindow.style.display === '') {
                    chatWindow.style.display = 'flex';
                } else {
                    chatWindow.style.display = 'none';
                }
            });
        });
    </script>

</head>
<body>

    <div id="chatbot-icon">
        <i class="fa fa-comment"></i>
    </div>

    <div id="chatbot-window">
        <div id="chatbot-header">
            Chat Bot
        </div>
        <div id="chatbot-content">
            <p><strong>Bot:</strong> Hello! How can I assist you today?</p>
        </div>
        <div id="chatbot-footer">
            <textarea id="chatbot-input" rows="2" placeholder="Type a message..."></textarea>
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>

</body>
</html>
