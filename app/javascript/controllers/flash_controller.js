import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    console.log("flash controller connected!", this.element);
  }

  remove() {
    // this.element.classList.add("d-none");
    this.element.style.display = "none";
    // this.element.remove();
  }
}
