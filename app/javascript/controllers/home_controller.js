// Import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["fact"];

//   connect() {
//     this.funFacts = [
//       "Fun Fact 1",
//       "Fun Fact 2",
//       "Fun Fact 3",
//       // Add more fun facts here
//     ];

//     this.currentFactIndex = 0;
//     this.updateFunFact();
//     this.startInterval();
//   }

//   updateFunFact() {
//     this.factTarget.textContent = this.funFacts[this.currentFactIndex];
//     this.currentFactIndex = (this.currentFactIndex + 1) % this.funFacts.length;
//   }

//   startInterval() {
//     this.interval = setInterval(() => {
//       this.updateFunFact();
//     }, 10000); // Update every 10 seconds
//   }

//   disconnect() {
//     clearInterval(this.interval);
//   }
// }
