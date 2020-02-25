// import flatpickr from "flatpickr"
// import "flatpickr/dist/themes/material_blue.css" // A path to the theme CSS

// flatpickr(".datepicker", {})


import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

flatpickr("#start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#end"})]



})



