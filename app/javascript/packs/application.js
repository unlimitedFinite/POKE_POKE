import 'bootstrap';
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { initAutocomplete } from '../plugins/init_autocomplete.js';
initAutocomplete();

import { initSelect2 } from '../plugins/init_select2';
import 'select2/dist/css/select2.css';
initSelect2();

import { countYellowStars, changeStarColor } from '../components/reviews';
countYellowStars();
changeStarColor();

import { initFlatpickr } from '../plugins/init_flatpickr';
initFlatpickr();






