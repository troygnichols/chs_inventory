$(function() {
  $('.datatable').each(function(index, element) {
    var url = $(element).data('uri');

    $(element).dataTable({
      processing: true,
      serverSide: true,
      ajax: url
    });
  });
});
