// app/javascript/controllers/sweet_alert_controller.js

import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

export default class extends Controller {
  connect() {
    console.log("SweetAlert2 Stimulus Controller is connected!")
  }

  async confirmSubmit(event) {
    event.preventDefault(); // Stop the form submission

    const result = await Swal.fire({
      title: 'Have you checked?',
      text: "Different councils have different rules and regulations for disposing of hard rubbish, including where to place the rubbish before collection. We recommend checking your council's website before posting anything on kerbside.",
      icon: 'question',
      showCancelButton: true,
      confirmButtonColor: '#FFBB02',
      cancelButtonColor: '#FF5C5C',
      confirmButtonText: 'Yes, submit it!'
    });

    if (result.isConfirmed) {
      this.element.submit(); // This refers to the form element itself
    }
  }
}
