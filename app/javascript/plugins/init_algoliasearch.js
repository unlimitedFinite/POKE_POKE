import * as algoliasearch from 'algoliasearch';

const client = algoliasearch('*************', '*****************');
const index = client.initIndex('Pokemon');

const initAlgolia = (query, facets = []) => {

  console.log('normal search');
  index.search(query, {
    hitsPerPage: 10, page: 0,
    facetFilters: facets
  })
    .then(function searchDone(content) {
      console.log(content)
    })
    .catch(function searchFailure(err) {
      console.error(err);
    });
}

// const initFacetHTML = () => {
//   const list = document.querySelector('#index-search');
//   list.insertAdjacentHTML('beforeend', `<input id="-search" class="m-3" type="text"`);
// }

export { initAlgolia }
