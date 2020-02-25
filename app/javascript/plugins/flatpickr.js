// import flatpickr from "flatpickr"
// import "flatpickr/dist/themes/material_blue.css" // A path to the theme CSS

// flatpickr(".datepicker", {})


import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#start", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  minDate: "today",


  altInput: true,
  plugins: [new rangePlugin({ input: "#end"})]



})



