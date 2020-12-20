import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const mainElement = document.querySelector('main.store');
    if (mainElement) {
      mainElement.innerHTML = data.html;
    }
  }
});
