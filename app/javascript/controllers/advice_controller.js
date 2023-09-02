import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.showAdviceModal();
  }

  showAdviceModal() {
    $('#recycleModal').modal('show');
  }
}
