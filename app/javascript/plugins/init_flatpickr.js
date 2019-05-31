import flatpickr from 'flatpickr';

const initFlatpickr = () => {

const startDateInput = document.getElementById('booking_start_dt');
const endDateInput = document.getElementById('booking_end_dt');

if (startDateInput) {
const unavailableDates = JSON.parse(document.querySelector('#pokemon-booking-dates').dataset.unavailable)
endDateInput.disabled = true
console.log(unavailableDates)

flatpickr("#booking_start_dt", {
  minDate: "today",
  disable: unavailableDates,
  dateFormat: "Y-m-d",
});

console.log('im in the file')
startDateInput.addEventListener("change", (e) => {
  if (startDateInput != "") {
    endDateInput.disabled = false
  }
  flatpickr("#booking_end_dt", {
    minDate: e.target.value,
    disable: unavailableDates,
    dateFormat: "Y-m-d"
    });
  })
};
}

export { initFlatpickr };
