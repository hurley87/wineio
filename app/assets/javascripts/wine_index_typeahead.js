var wines = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  limit: 10,
  prefetch: {
    url: window.location.origin + '/wines.json',
  }
});
 
wines.initialize();

$(document).ready(function() {
	$('#prefetch .typeahead').typeahead(null, {
	  name: 'wines',
	  displayKey: 'name',
	  source: wines.ttAdapter()
	});
});
 

