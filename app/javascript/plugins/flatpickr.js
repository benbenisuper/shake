// import flatpickr from "flatpickr"
// import "flatpickr/dist/themes/material_blue.css" // A path to the theme CSS

// flatpickr(".datepicker", {})


import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"


const calendarElement = document.getElementById('venue-booking-dates')
if (calendarElement) {

  const disable_dates = JSON.parse(calendarElement.dataset.unavailable);

  flatpickr("#start", {
    dateFormat: "Y-m-d",

    minDate: "today",
    disable: disable_dates,

    inline: true,


    altInput: false,
    plugins: [new rangePlugin({ input: "#end"})]



  })







}









