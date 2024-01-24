// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

/*
document.addEventListener("turbo:frame-missing", (event) => {
  const { detail: { response, visit } } = event;
  console.log('turbo:frame-missing', response, visit);
  event.preventDefault();
  visit(response.url);
});
*/

document.addEventListener('turbo:fetch-request-error', (event) => {
  console.log('fetch-request-error event', event);
});

document.addEventListener('turbo:before-fetch-response', (event) => {
  console.log('before-fetch-response event', event);

  const form = event.target;
  // Check if the form is the login form
  if (form.matches('[action="/users/sign_in"]')) {
    console.log('sign_in event', event);
  } else if (form.matches('[action="/users/sign_out"]')) {
    console.log('sign_out event', event);
  }
});

document.addEventListener('turbo:submit-end', (event) => {
  const form = event.target;
  console.log('turbo:submit-end event', event);
  // Check if the form is the login form
  if (form.matches('[action="/users/sign_in"]')) {
    const response = event.detail.fetchResponse;

    // Check the response status to determine success or failure
    if (response && response.ok) {
      console.log('Login successful');
    } else {
      console.log('Login failed');
    }
  } else if (form.matches('[action="/users/sign_out"]')) {
    const response = event.detail.fetchResponse;

    // Check the response status to determine success or failure
    if (response && response.ok) {
      // Sign-out success logic
      console.log('Sign-out successful');
    } else {
      // Sign-out failure logic
      console.error('Sign-out failed');
    }
  }
});
