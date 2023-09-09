import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["the treasure in your trash", "a bear in there", "the guitar for their hero", "a feather for their cap"],
      typeSpeed: 40,
      backSpeed: 50, // Optional: Speed of backspacing, you can adjust as needed
      backDelay: 1500,
      loop: true,
      showCursor: false,
    })
  }
}
