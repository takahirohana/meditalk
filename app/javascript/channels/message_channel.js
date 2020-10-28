import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let jikan = new Date();
    let year = jikan.getFullYear();
    let month = jikan.getMonth()+1;
    let date = jikan.getDate();
    let hour = jikan.getHours();
    let minute = jikan.getMinutes();
    let second = jikan.getSeconds();
    const html = `
    
        <div class="message-date-b">
          <p>${year}/${month}/${date} ${hour}:${minute}:${second}</p>
        </div>
      
      
          <div class="faq_area-b">
            <div>
              <dt><p>${data.content.content}</p></dt>
            </div>
          </div>
        </div>
    
    `;
    const messages = document.getElementById('messagesid');
    const newMessage = document.getElementById('message_content');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
    
    messages.scrollTop = messages.scrollHeight;
    // messages.scrollIntoView(false);
    
  }
});
