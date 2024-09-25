<div class="chatBot-content">
    <button class="chatBot-button" id="toggleChatBot">
        <img src="{{ asset('img/logo-small.png') }}" alt="lock" class="img" />
    </button>

    <div class="chatBot-chat hidden" id="chatBotChat">
        <section class="chat-header">
            <span>KwetuBot</span>
            <button class="close-chat" id="closeChatBot">
                <span aria-hidden="true">×</span>
            </button>
        </section>

        <section class="chat-body" id="chatBody">
            <!-- Les messages du chat apparaîtront ici -->
        </section>

        <section class="chat-footer">
            <input type="text" id="chatInput" class="chat-input" placeholder="Écrire un message..." />
            <button id="sendMessage" class="send-message">Envoyer</button>
            <button id="callButton" class="call-button">
            <svg fill="#000000" height="24px" width="24px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
                viewBox="0 0 482.6 482.6" xml:space="preserve">
            <g>
                <path d="M98.339,320.8c47.6,56.9,104.9,101.7,170.3,133.4c24.9,11.8,58.2,25.8,95.3,28.2c2.3,0.1,4.5,0.2,6.8,0.2
                    c24.9,0,44.9-8.6,61.2-26.3c0.1-0.1,0.3-0.3,0.4-0.5c5.8-7,12.4-13.3,19.3-20c4.7-4.5,9.5-9.2,14.1-14
                    c21.3-22.2,21.3-50.4-0.2-71.9l-60.1-60.1c-10.2-10.6-22.4-16.2-35.2-16.2c-12.8,0-25.1,5.6-35.6,16.1l-35.8,35.8
                    c-3.3-1.9-6.7-3.6-9.9-5.2c-4-2-7.7-3.9-11-6c-32.6-20.7-62.2-47.7-90.5-82.4c-14.3-18.1-23.9-33.3-30.6-48.8
                    c9.4-8.5,18.2-17.4,26.7-26.1c3-3.1,6.1-6.2,9.2-9.3c10.8-10.8,16.6-23.3,16.6-36s-5.7-25.2-16.6-36l-29.8-29.8
                    c-3.5-3.5-6.8-6.9-10.2-10.4c-6.6-6.8-13.5-13.8-20.3-20.1c-10.3-10.1-22.4-15.4-35.2-15.4c-12.7,0-24.9,5.3-35.6,15.5l-37.4,37.4
                    c-13.6,13.6-21.3,30.1-22.9,49.2c-1.9,23.9,2.5,49.3,13.9,80C32.739,229.6,59.139,273.7,98.339,320.8z M25.739,104.2
                    c1.2-13.3,6.3-24.4,15.9-34l37.2-37.2c5.8-5.6,12.2-8.5,18.4-8.5c6.1,0,12.3,2.9,18,8.7c6.7,6.2,13,12.7,19.8,19.6
                    c3.4,3.5,6.9,7,10.4,10.6l29.8,29.8c6.2,6.2,9.4,12.5,9.4,18.7s-3.2,12.5-9.4,18.7c-3.1,3.1-6.2,6.3-9.3,9.4
                    c-9.3,9.4-18,18.3-27.6,26.8c-0.2,0.2-0.3,0.3-0.5,0.5c-8.3,8.3-7,16.2-5,22.2c0.1,0.3,0.2,0.5,0.3,0.8
                    c7.7,18.5,18.4,36.1,35.1,57.1c30,37,61.6,65.7,96.4,87.8c4.3,2.8,8.9,5,13.2,7.2c4,2,7.7,3.9,11,6c0.4,0.2,0.7,0.4,1.1,0.6
                    c3.3,1.7,6.5,2.5,9.7,2.5c8,0,13.2-5.1,14.9-6.8l37.4-37.4c5.8-5.8,12.1-8.9,18.3-8.9c7.6,0,13.8,4.7,17.7,8.9l60.3,60.2
                    c12,12,11.9,25-0.3,37.7c-4.2,4.5-8.6,8.8-13.3,13.3c-7,6.8-14.3,13.8-20.9,21.7c-11.5,12.4-25.2,18.2-42.9,18.2
                    c-1.7,0-3.5-0.1-5.2-0.2c-32.8-2.1-63.3-14.9-86.2-25.8c-62.2-30.1-116.8-72.8-162.1-127c-37.3-44.9-62.4-86.7-79-131.5
                    C28.039,146.4,24.139,124.3,25.739,104.2z"/>
            </g>
            </svg>
            </button>
        </section>

        <div id="callDetails" class="call-details hidden">
            <span id="callTimer">00:00</span>
            <button id="endCallButton" class="end-call-button">Raccrocher</button>
        </div>
    </div>
</div>


<script>
    // Variable pour suivre l'état du message de bienvenue
    let welcomeMessageSent = false;

    document.getElementById('toggleChatBot').addEventListener('click', function() {
        var chat = document.getElementById('chatBotChat');
        var chatBody = document.getElementById('chatBody');

        if (chat.classList.contains('hidden')) {
            chat.classList.remove('hidden');

            // Vérifier et envoyer le message de bienvenue si nécessaire
            if (!welcomeMessageSent) {
                var welcomeMessage = document.createElement('div');
                welcomeMessage.className = 'bot-message';
                welcomeMessage.innerHTML = '<img src="{{ asset('img/bot-avatar.jpg') }}" alt="Bot Avatar" class="avatar" /> Bonjour ! KwetuBot est en cours de maintenance. Vous pouvez contacter le support technique à l\'adresse suivante : kwetupos@gmail.com.';
                chatBody.appendChild(welcomeMessage);

                // Marquer le message de bienvenue comme envoyé pour cette session
                welcomeMessageSent = true;
            }

            chatBody.scrollTop = chatBody.scrollHeight;
        } else {
            chat.classList.add('hidden');
        }
    });

    // Gestionnaire de clic pour fermer le chat
    document.getElementById('closeChatBot').addEventListener('click', function() {
        var chat = document.getElementById('chatBotChat');
        chat.classList.add('hidden'); // Cacher le chat

        // Optionnel: réinitialiser le message de bienvenue lorsque le chat est fermé
        // welcomeMessageSent = false; // Décommentez cette ligne si vous souhaitez réinitialiser l'état
    });

    document.getElementById('sendMessage').addEventListener('click', function() {
        sendMessage();
    });

    document.getElementById('chatInput').addEventListener('keypress', function(event) {
        if (event.key === 'Enter' && !event.shiftKey) {
            event.preventDefault();
            sendMessage();
        }
    });

    document.getElementById('callButton').addEventListener('click', function() {
        startCall();
    });

    document.getElementById('endCallButton').addEventListener('click', function() {
        endCall();
    });

    let callStartTime;
    let callInterval;

    function startCall() {
        const chatBody = document.getElementById('chatBody');
        const callDetails = document.getElementById('callDetails');
        const callTimer = document.getElementById('callTimer');

        callStartTime = new Date();
        callDetails.classList.remove('hidden');
        chatBody.appendChild(createBotMessage("L'appel est en cours..."));

        callInterval = setInterval(function() {
            const elapsedTime = new Date() - callStartTime;
            const minutes = Math.floor(elapsedTime / 60000);
            const seconds = Math.floor((elapsedTime % 60000) / 1000);
            callTimer.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
        }, 1000);

        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function endCall() {
        const chatBody = document.getElementById('chatBody');
        const callDetails = document.getElementById('callDetails');

        clearInterval(callInterval);
        callDetails.classList.add('hidden');
        chatBody.appendChild(createBotMessage("L'appel a été terminé."));

        chatBody.scrollTop = chatBody.scrollHeight;
    }

    function createBotMessage(content) {
        const botMessage = document.createElement('div');
        botMessage.className = 'bot-message';
        botMessage.innerHTML = `<img src="{{ asset('img/bot-avatar.jpg') }}" alt="Bot Avatar" class="avatar" /> ${content}`;
        return botMessage;
    }

    function sendMessage() {
        var chatInput = document.getElementById('chatInput');
        var message = chatInput.value.trim();

        if (message !== "") {
            var chatBody = document.getElementById('chatBody');

            // Afficher le message de l'utilisateur
            var newMessage = document.createElement('div');
            newMessage.className = 'user-message';
            newMessage.textContent = message;
            chatBody.appendChild(newMessage);

            chatInput.value = "";
            chatBody.scrollTop = chatBody.scrollHeight;

            // Désactiver le bouton "Envoyer" pendant l'envoi
            var sendButton = document.getElementById('sendMessage');
            sendButton.disabled = true;

            // Envoyer le message au serveur pour obtenir une réponse et stocker le message
            fetch('/chat/store', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                },
                body: JSON.stringify({
                    user_message: message
                })
            })
            .then(response => response.json())
            .then(data => {
                var botMessage = document.createElement('div');
                botMessage.className = 'bot-message';
                botMessage.innerHTML = '<img src="{{ asset('img/bot-avatar.jpg') }}" alt="Bot Avatar" class="avatar" /> ' + data.bot_response;
                chatBody.appendChild(botMessage);

                chatBody.scrollTop = chatBody.scrollHeight;
            })
            .catch(error => {
                console.error('Erreur lors de l\'envoi du message:', error);
                var errorMessage = document.createElement('div');
                errorMessage.className = 'bot-message';
                errorMessage.innerHTML = '<img src="{{ asset('img/bot-avatar.jpg') }}" alt="Bot Avatar" class="avatar" /> Désolé, une erreur est survenue. Vous pouvez contacter le service technique à l\'adresse suivante : kwetupos@gmail.com.';
                chatBody.appendChild(errorMessage);

                chatBody.scrollTop = chatBody.scrollHeight;
            })
            .finally(() => {
                sendButton.disabled = false;
            });
        }
    }
</script>

