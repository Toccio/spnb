import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    // enableTime: true
  });

  flatpickr("#range_start", {
    altInput: true,
    dateFormat: 'D, d M Y',
    plugins: [new rangePlugin({ input: "#range_end"})]
  });
}

export { initFlatpickr };
