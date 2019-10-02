import consumer from "./consumer"
consumer.subscriptions.create("LiveCounterChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
        console.log('Connected to channel')
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        const counter = document.getElementById('counter_value');
        const counterContainer = counter.parentNode.parentNode;

        if (parseInt(counterContainer.getAttribute('data-room-id')) === data.room_id) {
            counter.textContent = data['counter_value'];
            if (data['counter_value'] >= data['max_counter']) alert("You've reached the maximum quantity on this room")
        }
    }
});