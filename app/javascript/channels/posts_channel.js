import consumer from "./consumer"

consumer.subscriptions.create("PostsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("[data-post-id='3'][data-view='post-show']").replaceWith(data.post)
  }
});
