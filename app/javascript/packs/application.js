import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { initAutocomplete } from '../plugins/init_autocomplete.js';
initAutocomplete();

import { initSelect2 } from '../plugins/init_select2';
import 'select2/dist/css/select2.css';
initSelect2();

import { initAlgolia } from '../plugins/init_algoliasearch'

let query = '';
let facets = [];
let priceQuery = '';
let ratingQuery = '';
let addressQuery = '';
const searchBar = document.getElementById("pokemon-search");
const priceInput = document.getElementById("price-search");
const ratingInput = document.getElementById("rating-search");
const addressInput = document.getElementById("address-search");
searchBar.addEventListener('keyup', (event) => {
  if (event.key === 'Backspace') {
    query = query.slice(0, query.length - 1);
  } else {
    query += event.key;
  }
  priceInput.addEventListener('keyup', (event) => {
    if (event.key === 'Backspace') {
      priceQuery = priceQuery.slice(0, priceQuery.length - 1);
    } else {
      priceQuery += priceQuery.key;
    }
    facets.push(`price_per_day:${priceQuery}`);
  });
  ratingInput.addEventListener('keyup', (event) => {
    if (event.key === 'Backspace') {
      ratingQuery = ratingQuery.slice(0, ratingQuery.length - 1);
    } else {
      ratingQuery += ratingQuery.key;
    }
    facets.push(`rating:${ratingQuery}`);
  });
  addressInput.addEventListener('keyup', (event) => {
    if (event.key === 'Backspace') {
      addressQuery = addressQuery.slice(0, addressQuery.length - 1);
    } else {
      addressQuery += addressQuery.key;
    }
    facets.push(`address:${addressQuery}`);
  });


  initAlgolia(query, facets);
  console.log(query);
  console.log(facets);
});
