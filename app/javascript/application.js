// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

if (window.location.href === 'http://localhost:3000/' || window.location.href === 'http://www.kerbside.org/') {
  document.querySelector(".navbar").classList.add("fixed-top")
  document.querySelector(".navbar").classList.add("transparent-nav")
} else {
  document.querySelector(".navbar").classList.remove("fixed-top")
  document.querySelector(".navbar").classList.remove("transparent-nav")
  document.querySelector(".navbar").classList.add("sticky-top")
}
