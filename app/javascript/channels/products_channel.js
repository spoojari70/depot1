import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
  
},

  disconnected() {
    
},

  received(data) {
    const storeElement = document.querySelector("main.store")
    if (storeElement) {
      storeElement.innerHTML = data.html
    } 
  }
});